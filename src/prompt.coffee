util = require 'util'
readline = require 'readline'
_ = require 'underscore'

commands = require './commands'

exports.run = (cache) ->

	context =
		path: []
		pointer: cache
		cache: cache

	getCompletions = (str, callback) ->
		index = str.indexOf(' ')

		unless index > 0
			return callback null, [_.keys(commands), str]

		command = str.substr(0, index).toLowerCase()
		rest    = str.substr(index).trim()
		handler = commands[command]

		if handler?
			handler.autocomplete context, rest, callback
		else
			callback null, [[], str]

	clearScreen = ->
		process.stdout.write '\u001B[2J\u001B[0;0f'

	getTypeAtPointer = (obj) ->
		return "arr[#{context.pointer.length}]"          if _.isArray(context.pointer)
		return "obj{#{_.keys(context.pointer).length}}" if _.isObject(context.pointer)
		return typeof(context.pointer)

	showPrompt = ->
		tokens = [
			'jwalk'
			getTypeAtPointer(context.pointer)
			'/' + context.path.join('/')
			'$ '
		]
		readline.setPrompt tokens.join(' ')
		readline.prompt()

	processCommand = (line, callback) ->
		args = line.match /("[^"]+"="[^"]+")|("[^"]+"=[^\s]+)|([^\s]+="[^"]+")|("[^"]+")|([^\s]+)/g
		command = args.shift().toLowerCase()
		handler = commands[command]
		if handler?
			handler.run(context, args, callback)
		else
			console.log "What is a '#{command}'?".red
			callback()
		
	readline = readline.createInterface(process.stdin, process.stdout, getCompletions)

	readline.on 'line', (line) ->
		processCommand line.trim(), ->
			showPrompt()

	readline.on 'close', ->
		console.log()
		process.exit(0)

	process.stdin.on 'keypress', (stream, key) ->
		if key and key.ctrl and key.name is 'l'
			clearScreen()
			showPrompt()

	showPrompt()
