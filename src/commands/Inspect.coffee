Command = require './Command'

class Inspect extends Command

	help: ->
		'examines a single node'

	run: (context, args, callback) ->
		depth = if args.length > 0 then Number(args[0]) else 1
		@inspect context.pointer, depth
		callback()

module.exports = Inspect