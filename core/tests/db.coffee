process.env.NODE_ENV = 'test'

assert        = require 'assert'
core          = require('../core')
chai          = require 'chai'
chaiHttp      = require 'chai-http'
should        = chai.should()

chai.use chaiHttp

describe 'Database:', ->
  it 'should connect to DB', (done) ->
    db = require '../db'
    db.should.be.a 'object' 
    done()
  it 'db.name should be "test"', (done) ->
    db = require '../db'
    db.name.should.equal 'test'
    done()