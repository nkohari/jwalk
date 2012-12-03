ChangePath  = require './ChangePath'
ClearScreen = require './ClearScreen'
ExitProcess = require './ExitProcess'
Help        = require './Help'
ShowKeys    = require './ShowKeys'
Inspect     = require './Inspect'

commands =
	cd:    new ChangePath()
	clear: new ClearScreen()
	cls:   new ClearScreen()
	exit:  new ExitProcess()
	keys:  new ShowKeys()
	ls:    new Inspect()
	quit:  new ExitProcess()

commands.help = new Help(commands)

module.exports = commands
