###

    Task:controller

###
debug  = require('debug')('cms:sockets:task')
mongoose = require 'mongoose'
require '../models/task'
crud = {}

crud.create = (req, res) ->
  Resource = mongoose.model 'Task'
  fields = req.body

  rec = new Resource(fields)
  rec.save (err, resource) ->
    if err then res.json {'ERROR': err}
    else res.json {'SUCCESS': resource}

crud.retrieve = (req, res) ->
  Resource = mongoose.model 'Task'
  if req.params.id?
    Resource.findById req.params.id, (err, resource) ->
      if err then res.send(500, { error: err }) 
      else if resource then res.send resource

  else
    Resource.find {}, (err, coll) ->
      res.send coll

crud.update = (req, res) ->
  Resource = mongoose.model 'Task'
  fields = req.body

  Resource.findByIdAndUpdate req.params.id, { $set: fields }, (err, resource) ->
    if err then res.json {'ERROR': err}
    else res.json {'UPDATED': resource}

crud.delete = (req, res) ->
  Resource = mongoose.model 'Task'

  Resource.findByIdAndRemove req.params.id, (err, resource) ->
    if err then res.json {'ERROR': err}
    else res.json {'REMOVED': resource}

exports.crud = crud

exports.socket = (socket) ->
  debug 'someone connected to task'
  socket.emit 'hi'
  socket.on 'some', (data) -> 
    debug 'some event ' + JSON.stringify data