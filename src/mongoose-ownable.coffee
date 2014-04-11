##
# mongoose-trashable
# https://github.com/yi/mongoose-trashable
#
# Copyright (c) 2014 yi
# Licensed under the MIT license.
##

# default plugin options values
DEFAULT_KEY_NAME = "trashed_at"

dateJSON = (key) ->
  json = {}
  json[key] = Date
  json

# mongoose-times plugin method
module.exports = exports  = (schema, options)->
  keyName = (options || {}).keyName || DEFAULT_KEY_NAME

  schema.add dateJSON(keyName)

  schema.methods.trash = (callbak)->
    @[keyName] = Date.now()
    @save(callbak)
    return

  schema.methods.untrash = (callbak)->
    @[keyName] = null
    @save(callbak)
    return




