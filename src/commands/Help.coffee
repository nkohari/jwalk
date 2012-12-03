_ = require 'underscore'
Command = require './Command'

class Help extends Command

	constructor: (@commands) ->

	help: ->
		'shows this help message'

	run: (context, args, callback) ->
		names = _.keys(@commands)
		names.sort()

		console.log()
		for name in names
			console.log "#{name}\t#{@commands[name].help()}"
		console.log()

		callback()

module.exports = Help
