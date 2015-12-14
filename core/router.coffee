###

    ROUTER

###

express           = require 'express'
passport          = require 'passport'
Account           = require '../core/models/account'
debug             = require('debug')('cms:router')
chalk             = require 'chalk'
router            = express.Router()


router.get '/', (req, res ) ->
  res.render 'index', user : req.user

router.route '/register'
  .get (req, res) -> res.render 'register', {}
  .post (req, res, next) ->
      Account.register(new Account({ username : req.body.username }),
          req.body.password, 
          (err, account) ->
            if err then return res.render 'register', info: "Имя занято"
            passport.authenticate('local')(req, res, () ->
                req.session.save( (err) ->
                    if err then debug err
                    res.redirect('/');
                )
            )
      )

router.get '/admin', (req, res) -> res.render 'admin', title: 'About'

# SAMPLE
sample = require './controllers/sample' 
router.route '/sample'
  .get (req, res) -> sample.retrieve(req, res)
  .post (req, res) -> sample.create(req, res)
router.route '/sample/:id'
  .get (req, res) -> sample.retrieve(req, res)
  .put (req, res) -> sample.update(req, res)
  .delete (req, res) -> sample.delete(req, res)


staticPage = require './controllers/static' 
router.route '/static'
  .get (req, res) -> staticPage.retrieve(req, res)
  .post (req, res) -> staticPage.create(req, res)
router.route '/static/:id'
  .get (req, res) -> staticPage.retrieve(req, res)
  .put (req, res) -> staticPage.update(req, res)
  .delete (req, res) -> staticPage.delete(req, res)

router.route '/login'
  .get (req, res) -> res.render 'login', user: req.user 
  .post passport.authenticate('local'), 
        (req, res, next) ->
            req.session.save (err) ->
                if err then return next err
                res.redirect '/'

router.get '/logout', (req, res, next) ->
  req.logout();
  req.session.save (err) ->
      if err then return next err
      res.redirect '/'

router.get '/ping', (req, res) -> res.status(200).send("pong!");

router.get '/about', (req, res) -> res.render 'index', title: 'About'

router.route '/dev/:param'
    .get (req, res) ->  
      res.render ('dev/' + req.params.param), 
                          page : req.params.param,
                          (err, html) ->  
                              if err 
                                err.status = 418
                                debug chalk.red err.status, err, err.stack
                                throw err
                              else res.send html


# ATTACHMENT
attachment = require './controllers/attachment'
router.route '/upload'
  .get (req, res ) -> res.render 'upload'
  .post (req, res ) ->
    attachment.create req, res
    res.render 'upload'


module.exports = router