###

    Attachment: model

###

mongoose = require 'mongoose'

schema = new mongoose.Schema
  name: String
  path: String
  type: String
  extension: String
  size: Number
  date: Date
  parentId: Number
  linkedIds: [ Number ]
  access:
    groups: Array
    users: Array


module.exports = mongoose.model "Attachment", schema