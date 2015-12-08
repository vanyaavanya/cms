###

    Static: controller

###

mongoose = require 'mongoose'
require '../models/static'

exports.create = (req, res) ->
  Resource = mongoose.model 'Static'
  fields = req.body

  rec = new Resource(fields)
  rec.save (err, resource) ->
    if err then res.json {'ERROR': err}
    else res.json {'SUCCESS': resource}

exports.retrieve = (req, res) ->
  Resource = mongoose.model 'Static'
  if req.params.id?
    Resource.findById req.params.id, (err, resource) ->
      if err then res.send(500, { error: err }) 
      else if resource then res.send resource

  else
    Resource.find {}, (err, coll) ->
      res.send coll

exports.update = (req, res) ->
  Resource = mongoose.model 'Static'
  fields = req.body

  Resource.findByIdAndUpdate req.params.id, { $set: fields }, (err, resource) ->
    if err then res.json {'ERROR': err}
    else res.json {'UPDATED': resource}

exports.delete = (req, res) ->
  Resource = mongoose.model 'Static'

  Resource.findByIdAndRemove req.params.id, (err, resource) ->
    if err then res.json {'ERROR': err}
    else res.json {'REMOVED': resource}