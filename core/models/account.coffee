###

    ACCOUNT model

    https://github.com/saintedlama/passport-local-mongoose
###

mongoose              = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'

schema = new mongoose.Schema
    username: String,
    password: String


schema.plugin passportLocalMongoose

module.exports = mongoose.model 'Accounts', schema