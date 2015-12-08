###

    Static: model

###

mongoose = require 'mongoose'

schema = new mongoose.Schema
  status:
    type: String
  title:
    type: String
  url:
    type: String
  meta:
    description:
      type: String
    keys:
      type: Array
  content: type: String
  date:
    published:  Date
    updated:  Date
  owner: 
    name: String
    img: String
    url: String
  hide:
    navigation: Boolean
    sitemap: Boolean
  tags: Array
  access:
    groups: Array
    users: Array

# schema.methods.dance = -> this.name = this.name + ' chachacha'; 
# schema.virtual('name.good').get () -> this.name + ' is good'

module.exports = mongoose.model "Static", schema