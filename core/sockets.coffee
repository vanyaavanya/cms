socketio = require('socket.io')
debug    = require('debug')('cms:sockets')
project  = require './controllers/project'
task     = require './controllers/project'
sprint   = require './controllers/project'

module.exports.listen = (server) ->
  io = socketio.listen(server)

  # users = io.of('/users')
  io.on 'connection', (socket) -> 
    debug 'user connected'
    # io.emit 'hi', 'everyone'

    socket.on 'disconnect', () ->
      debug 'user disconnected'

    io.of('/project').on 'connection', project.socket
    io.of('/task').on 'connection', task.socket
    # io.of('/sprint').on 'connection', sprint.socket


