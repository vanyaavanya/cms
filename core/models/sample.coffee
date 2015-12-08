###

    Sample: model

###

mongoose = require 'mongoose'

schema = new mongoose.Schema
  name:
    type: String,
    trim: true
  num:
    type: Number,
    min: 0
  # created_at: { type: Date, default: Date.now }

# schema.methods.dance = -> this.name = this.name + ' chachacha'; 
# schema.virtual('name.good').get () -> this.name + ' is good'

module.exports = mongoose.model "Sample", schema