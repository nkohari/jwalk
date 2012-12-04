_ = require 'underscore'
Command = require './Command'

class ChangePath extends Command

	help: ->
		'navigates through nodes in the tree'

	autocomplete: (context, str, callback) ->
		super unless _.isObject(context.pointer)
		keys    = _.keys(context.pointer)
		matches = _.filter keys, (key) -> key.indexOf(str) == 0
		results = if matches.length > 0 then matches else keys
		callback null, [results, str]

	run: (context, args, callback) ->
		path = @_getRelativePath context, args[0]

		unless path?
			console.log "Invalid path".red
			return callback()

		pointer = @_resolvePointer context, path

		unless pointer?
			console.log "Couldn't resolve path '#{path}'".red
			return callback()

		context.pointer = pointer
		context.path = path

		callback()

	_resolvePointer: (context, path) ->
		pointer = context.tree
		for token in path
			return null unless pointer[token]?
			pointer = pointer[token]
		return pointer

	_getRelativePath: (context, str) ->
		str = '/' if not str? or str.length is 0
		segments = _.filter str.split('/'), (segment) -> segment.length
		if str[0] is '/'
			path = segments
		else
			path = context.path.slice(0)
			for segment in segments
				if segment is '..'
					if path.length is 0 then return null
					path.pop()
				else
					path.push segment
		return path

module.exports = ChangePath

