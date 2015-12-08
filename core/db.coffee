###

    Database

###

debug       = require('debug')('cms:db')
chalk       = require 'chalk'
nconf       = require 'nconf'
mongoose    = require 'mongoose'
 
#  NCONF SETTINGS
nconf.argv().env().file  file: './config.json' 

devConf = nconf.get process.env.NODE_ENV or 'development'

mongoose.connect devConf.url, (err) -> 
  if err then throw err else debug (devConf.url + ' connected')

db = mongoose.connection;

db.on 'error', (err) -> debug 'connection error:', err.message

process.on 'uncaughtException', (err) ->
    if err.name is "MongoError"
      err.caught = on
      debug chalk.red err.name + ": Connection Refused by the server, make sure that the mongod daemon is enabled \n"  + err.stack
    
module.exports = db