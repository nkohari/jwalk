Command = require './Command'

class ClearScreen extends Command

	help: ->
		'clears the screen'

	run: (context, args, callback) ->
		console.log '\u001B[2J\u001B[0;0f'
		callback()

module.exports = ClearScreen