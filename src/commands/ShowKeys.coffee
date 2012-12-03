_ = require 'underscore'
Command = require './Command'

class ShowKeys extends Command

	help: ->
		'examines the keys of an object node'

	run: (context, args, callback) ->
		
		unless _.isObject(context.pointer)
			console.log "Not an object".red
			callback()

		@inspect _.keys(context.pointer), 1
		callback()

module.exports = ShowKeys
