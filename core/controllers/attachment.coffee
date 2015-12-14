###

    Attachment: controller

###

mongoose   = require 'mongoose'
fs         = require 'fs'
path       = require 'path'
formidable = require 'formidable'
moment     = require 'moment'

require '../models/attachment'

form = new formidable.IncomingForm();
form.uploadDir = path.join __dirname, '/../..', '/uploads/'
###
renameReceived = (file)->
  dir = form.uploadDir
  checkPath = path.join(dir, file.name)
  fs.stat checkPath, (err, stat)->
    if err
      fs.rename file.path, checkPath
    if stat
      f = path.parse(file.name)
      console.log(file)
      now = moment().format('x')
      fs.rename file.path, path.join(dir, "#{f.name}_#{now}#{f.ext}")

form.on 'file', (name, file) ->
  if file.size == 0
    fs.unlink(file.path)
  else
    renameReceived(file)
###
# part это стрим, так наверное лучше, но уже поздно!
form.onPart = (part) ->
  console.log(part)

exports.create = (req) ->
  form.parse req, (err, fields, files) ->
    if err then console.log err
    else if files then console.log 'received'

