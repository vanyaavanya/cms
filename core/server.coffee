###

    SERVER

###

http              = require 'http'
debug             = require('debug')('cms:server')
logger            = require('./logger')(module)
chalk             = require 'chalk'
sockets           = require('./sockets')

port = process.env.PORT or '3000'  

exports.start = (app) ->
  server = http.createServer app
  server.listen port, 
                false,
                console.log chalk.green 'Started on port ' + port
                debug chalk.green.bold 'started on port ' + port + ' in ' + process.env.NODE_ENV + ' mode'

  server.on 'error', (err) -> debug chalk.red err 

  sockets.listen(server)
