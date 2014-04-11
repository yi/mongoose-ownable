require 'mocha'
should = require('chai').should()

mocha = require "mocha"
should = require "should"

transable = require "../mongoose-trashable"

mongoose = require "mongoose"
Schema = mongoose.Schema

mongoose.connect("mongodb://localhost/test-mongoose-trashable")
mongoose.connection.on "error", (err) ->
  console.error "MongoDB error: #{err.message}"
  console.log "Make sure MongoDB is up and running on #{database}."

TestSchema = new Schema {}
TestSchema.plugin transable
TestModel = mongoose.model("Test", TestSchema)

#TestCustomSchema = new Schema {}
#TestCustomSchema.plugin timestamps, { created: "posted", lastUpdated: "updated" }
#TestCustomModel = mongoose.model("TestCustom", TestCustomSchema)

after((done) ->
  mongoose.connection.db.dropDatabase()
  done()
)

describe "mongoose-trashable", ->
  it "trash / untrash methods", (done) ->
    timestamp = Date.now()
    new TestModel().trash (err, doc) ->
      if err then done err
      doc.trashed_at.should.be.within timestamp, Date.now()
      console.log "[mongoose-trashable_test] doc.trashed_at:#{doc.trashed_at}"

      doc.untrash (err, doc)->
        should.not.exist doc.trashed_at
        doc.untrash (err, doc)->
          # continue untrash should work
          should.not.exist doc.trashed_at
          done()
          return
        return
      return
    return
  return



