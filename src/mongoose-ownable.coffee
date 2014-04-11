##
# mongoose-ownable
# https://github.com/yi/mongoose-ownable
#
# Copyright (c) 2014 yi
# Licensed under the MIT license.
##

assert = require "assert"

# mongoose-times plugin method
module.exports = exports  = (schema)->

  schema.add owner_id:String

  # find a doc by id and insure it's owned by owner id
  # @param {String} id
  # @param {String} ownerId
  # @param {Function} callback, signature: callback(err, item)
  schema.statics['findByIdAndOwnerId'] = (id, ownerId, callback)->

    assert(('function' is typeof callback), "missing callback")

    unless('string' is typeof id) and ('string' is typeof ownerId)  and id and ownerId
      return callback(new Error("bad arguments. id:#{id}, ownerId:#{ownerId}"))

    this.findById id, (err, item)->
      return callback err if err?
      return callback( new Error("#{id} not found")) unless item
      return callback( new Error("#{id} permission denied")) unless item.owner_id is ownerId
      return callback(null, item)
    return

  return




