Command = require './Command'

class ExitProcess extends Command

	help: ->
		'quit jwalk'

	run: (context, args, callback) ->
		console.log 'kbye'
		process.exit(0)

module.exports = ExitProcess