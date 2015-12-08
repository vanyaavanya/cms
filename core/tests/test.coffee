###

    TEST:

Router
  Primary
    '/'
    '/ping'
    '/admin'
  Models
    Sample CRUD

###

process.env.NODE_ENV = 'test'

assert        = require 'assert'
core          = require('../core')
chai          = require 'chai'
chaiHttp      = require 'chai-http'
should        = chai.should()

chai.use chaiHttp

Sample = require "../models/sample"

describe 'Primary:', ->
  it 'GET / should have status 200 ', (done) ->
    chai.request core.app
      .get '/'
      .end (err, res) ->
        res.should.have.status 200
        done()

  it 'GET /ping should have status 200 ', (done) ->
    chai.request core.app
      .get '/ping'
      .end (err,  res) ->
        res.should.have.status 200
        done()

  it 'GET /admin should have status 200 ', (done) ->
    chai.request core.app
      .get '/admin'
      .end (err,  res) ->
        res.should.have.status 200
        done()

describe 'Sample:', ->
  describe 'Sample:', ->

  after (done) ->
    core.db.close()
    done()

  describe 'CRUD:', ->
    Sample.collection.remove()

    beforeEach (done) ->
      newSample = new Sample({
        name: 'Sample-test',
        num: 0
      });
      newSample.save (err) -> done()
    afterEach (done) ->
      Sample.collection.remove()
      done()

    it 'should list ALL sample on /sample GET', (done) ->
      chai.request core.app
        .get '/sample'
        .end (err, res) ->
          res.should.have.status 200
          res.should.be.json
          res.body.should.be.a 'array'
          res.body[0].should.have.property '_id'
          res.body[0].should.have.property 'name'
          res.body[0].should.have.property 'num'
          res.body[0].name.should.equal 'Sample-test'
          res.body[0].num.should.equal 0
          done()

    it 'should list a SINGLE sample on /sample/<id> GET', (done) ->
      newSample = new Sample({
        name: 'Sample-test',
        num: 0
      });
      newSample.save (err, data) ->
        chai.request core.app
          .get '/sample/' + data.id
          .end (err, res) ->
            res.should.have.status 200
            # res.should.be.json
            res.body.should.be.a 'object'
            res.body.should.have.property '_id'
            res.body.should.have.property 'name'
            res.body.should.have.property 'num'
            res.body.name.should.equal 'Sample-test'
            res.body.num.should.equal 0
            res.body._id.should.equal data.id
            done();

    it 'should add a SINGLE sample on /sample POST', (done) ->
      chai.request core.app
        .post '/sample/'
        .send {'name': 'Sample', 'num': 0}
        .end (err, res) ->
          res.should.have.status 200
          res.should.be.json
          res.body.should.be.a 'object' 
          res.body.should.have.property 'SUCCESS'
          res.body.SUCCESS.should.be.a 'object'
          res.body.SUCCESS.should.have.property 'name'
          res.body.SUCCESS.should.have.property 'num'
          res.body.SUCCESS.should.have.property '_id'
          res.body.SUCCESS.name.should.equal 'Sample'
          res.body.SUCCESS.num.should.equal 0
          done()

    it 'should update a SINGLE sample on /sample/<id> PUT', (done) ->
      chai.request core.app
        .get '/sample'
        .end (err, res) ->
          chai.request core.app
            .put '/sample/' + res.body[0]._id
            .send {'name': 'Sample-test'}
            .end (error, response) ->
              response.should.have.status 200
              response.should.be.json
              response.body.should.be.a 'object'
              response.body.should.have.property 'UPDATED'
              response.body.UPDATED.should.be.a 'object'
              response.body.UPDATED.should.have.property 'name'
              response.body.UPDATED.should.have.property '_id'
              response.body.UPDATED.name.should.equal 'Sample-test'
              done()

    it 'should delete a SINGLE sample on /sample/<id> DELETE', (done) ->
      chai.request core.app
        .get '/sample/'
        .end (err, res) ->
          chai.request core.app
            .delete '/sample/' + res.body[0]._id
            .end (error, response) ->
              response.should.have.status 200
              response.should.be.json
              response.body.should.be.a 'object'
              response.body.should.have.property 'REMOVED'
              response.body.REMOVED.should.be.a 'object'
              response.body.REMOVED.should.have.property 'name'
              response.body.REMOVED.should.have.property '_id'
              response.body.REMOVED.name.should.equal 'Sample-test'
              done()


  # describe 'Something:', ->
  #   describe 'great:', ->
  # it('should list a SINGLE great on /great/<id> GET');
  # it('should add a SINGLE great on /great POST');
  # it('should update a SINGLE great on /great/<id> PUT');
  # it('should delete a SINGLE great on /great/<id> DELETE');