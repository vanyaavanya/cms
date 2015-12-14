###

    CORE

### 

express           = require 'express'
path              = require 'path'
fs                = require 'fs'
chalk             = require 'chalk'
debug             = require('debug')('cms:core')
bodyParser        = require 'body-parser'
cookieParser      = require 'cookie-parser'
passport          = require 'passport'
LocalStrategy     = require('passport-local').Strategy;
logger            = require('./logger')(module)
reqlogger         = require './reqlogger'
db                = require './db'
routes            = require './router'

app = express()

process.env.NODE_ENV = process.env.NODE_ENV or 'development' # NODE_ENV=DEVELOPMENT

app.use bodyParser.json()
app.use bodyParser.urlencoded { extended: true }
app.use cookieParser()
app.use express.static path.join __dirname, 'public' 
app.disable 'x-powered-by'  # Убирает X-Powered-By:Express из header


# TEMPLATES
app.set 'views', './views'
app.set 'view engine', 'jade'

app.use require('express-session')(
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: false
)
app.use passport.initialize()
app.use passport.session()
app.use express.static 'public'

# LOGGING
app.use reqlogger 

# ROUTING
app.use '/', routes

# passport config
Account = require './models/account'
passport.use new LocalStrategy Account.authenticate()
passport.serializeUser Account.serializeUser()
passport.deserializeUser Account.deserializeUser()

# 404
app.get '*', (req, res, next) ->
  err = new Error()
  err.status = 404
  next err

# ERROR HANDLING
app.use (err, req, res, next) -> 
  res.status err.status or 500
  res.render  'error', 
              message : err.message
              error : if app.get('env') is 'development' then err else {}  # Не выводить stacktrace в продакшене
  logger.error err

# Вести лог 
process.on 'uncaughtException', (err) ->
  if not err.caught then debug chalk.red err 

require('./server').server

exports.db  = db
exports.app = app