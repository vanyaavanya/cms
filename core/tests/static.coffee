###

    TEST:STATIC

###

process.env.NODE_ENV = 'test'

assert        = require 'assert'
core          = require('../core')
chai          = require 'chai'
chaiHttp      = require 'chai-http'
should        = chai.should()

chai.use chaiHttp

Static = require "../models/static"
fiction = require './fakes/static-fake'

paths = Static.schema.paths
keys = Object.keys paths

# Todo fiction !
# fakeThat = (model) ->
#   for key in Object.keys model.schema.paths
#     _.extend(model.schema.paths[key], {fake: 'fake'}) 


describe 'Static:', ->
    describe 'CRUD:', ->
      it 'all fields of res should match model types in /static POST', (done) ->
        chai.request core.app
          .post '/static/'
          .send fiction
          .end (err, res) ->
            throw err if err?
            # Проверка по типу на основании модели
            for key in keys
              field = eval 'res.body.SUCCESS.' + key
              if paths[key].instance is 'Date' or paths[key].instance is 'ObjectID' then continue
              field.should.be.a paths[key].instance
            done()
      it 'should list ALL static on /static GET', (done) ->
        chai.request core.app
          .get '/static'
          .end (err, res) ->
            res.should.have.status 200
            res.should.be.json
            res.body.should.be.a 'array'
            res.body[0].should.have.property '_id'
            done()

      it 'should list a SINGLE static on /static/<id> GET', (done) ->
        newSample = new Static fiction
        newSample.save (err, data) ->
          chai.request core.app
            .get '/static/' + data.id
            .end (err, res) ->
              res.should.have.status 200
              # res.should.be.json
              res.body.should.be.a 'object'
              res.body.should.have.property '_id'
              res.body._id.should.equal data.id
              done();

      it 'should add a SINGLE static on /static POST', (done) ->
        chai.request core.app
          .post '/static/'
          .send fiction
          .end (err, res) ->
            throw err if err?
            res.should.have.status 200
            res.should.be.json
            res.body.should.be.a 'object' 
            res.body.should.have.property 'SUCCESS'
            res.body.SUCCESS.should.be.a 'object'
            done()

      it 'should update a SINGLE static on /static/<id> PUT', (done) ->
        chai.request core.app
          .get '/static'
          .end (err, res) ->
            chai.request core.app
              .put '/static/' + res.body[0]._id
              .send fiction
              .end (error, response) ->
                response.should.have.status 200
                response.should.be.json
                response.body.should.be.a 'object'
                response.body.should.have.property 'UPDATED'
                response.body.UPDATED.should.be.a 'object'
                response.body.UPDATED.should.have.property '_id'
                done()

      it 'should delete a SINGLE static on /static/<id> DELETE', (done) ->
        chai.request core.app
          .get '/static/'
          .end (err, res) ->
            chai.request core.app
              .delete '/static/' + res.body[0]._id
              .end (error, response) ->
                response.should.have.status 200
                response.should.be.json
                response.body.should.be.a 'object'
                response.body.should.have.property 'REMOVED'
                response.body.REMOVED.should.be.a 'object'
                response.body.REMOVED.should.have.property '_id'
                done()


      # TODO рекурсивный обход свойств
      # it 'all props shoud match in /static POST', (done) ->
      #   chai.request core.app
      #     .post '/static/'
      #     .send fiction
      #     .end (err, res) ->
      #       throw err if err?
      #       for key in keys
      #         res.body.SUCCESS.should.have.property key
      #       done()


# res.body.SUCCESS.should.have.property '_id'
# res.body.SUCCESS.should.equal 'Sample-test'

# describe 'Something:', ->
#   describe 'great:', ->
  # it('should list a SINGLE great on /great/<id> GET');
  # it('should add a SINGLE great on /great POST');
  # it('should update a SINGLE great on /great/<id> PUT');
  # it('should delete a SINGLE great on /great/<id> DELETE');