ChangePath  = require './ChangePath'
ShowKeys    = require './ShowKeys'
Inspect     = require './Inspect'
ExitProcess = require './ExitProcess'

module.exports =
	cd:   new ChangePath()
	exit: new ExitProcess()
	keys: new ShowKeys()
	ls:   new Inspect()
	quit: new ExitProcess()
