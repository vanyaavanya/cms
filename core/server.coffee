# ###

#     SERVER

# ###


debug             = require('debug')('cms:server')
logger            = require('./logger')(module)
chalk             = require 'chalk'
http              = require('http')
sockets           = require('./sockets')

port = process.env.PORT or '3000'  

server = http.createServer().listen port, 
                                    false,
                                    console.log chalk.green 'Started on port ' + port
                                    debug chalk.green.bold 'started on port ' + port + ' in ' + process.env.NODE_ENV + ' mode'

sockets.listen(server)

exports.server = server 
exports.sockets = sockets 
