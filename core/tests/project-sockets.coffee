###

    Project: sockets tests

###

ioServer = require 'socket.io'
ioClient = require 'socket.io-client'
core     = require '../core'
chai     = require 'chai'

chai.should()

server = require('../server.coffee')

socketURL = 'http://localhost:3000/project'

options =
  transports: ['websockets']
  'force new connection':true

Project = require '../models/project'
fiction = require './fakes/project-fake'

paths = Project.schema.paths
keys = Object.keys paths


describe "PROJECT:", ->

  afterEach (done) ->
    Project.collection.remove()
    done()

  describe 'SOCKETS:', ->
    it 'should create a SINGLE project on project/create ', (done) ->
      client = ioClient.connect(socketURL)
      client.emit 'project/create'
      client.once 'project/created', (data) ->
        data.project.should.be.a 'object'
        data.project.should.have.property '_id'
        client.disconnect()
        done()

    # it 'should update a SINGLE project fileds on project/update', (done) ->
    #   client = ioClient.connect(socketURL)
    #   client.emit 'project/create'
    #   client.once 'project/created', (data) ->
    #     client.emit 'project/update', { title: 'newTitle'}, (data) ->
    #       data.project.should.be.a 'object'
    #       data.project.should.have.property '_id'
    #       client.disconnect()
    #       done()
        # client.emit 'project/findOne', { id: data.project._id}, (err) ->
          # console.log err if err?


    # it 'should delete a SINGLE project on project/delete ', (done) ->
    #   client = ioClient.connect(socketURL)
    #   client.emit 'project/create'
    #   client.on 'project/created', (data) ->
    #     Project.findByIdAndRemove data.project._id, (err) ->
    #       if err then console.log data.project._id + 'not removed' + err
    #       else done()



  # before (done) ->
  #   server.start core.app, done
  # after (done) ->
  #   server.stop done

  # it "Should broadcast new user to all users", (done) ->
  #   client1 = ioClient.connect(socketURL)
  #   client1.on "connect", (data) ->
  #     client1.emit "connection name", chatUser1
  #     client2 = ioClient.connect(socketURL, options)
  #     client2.on "connect", (data) ->
  #       client2.emit "connection name", chatUser2

  #     client2.on "new user", (usersName) ->
  #       usersName.should.equal chatUser2.name + " has joined."
  #       client2.disconnect()

