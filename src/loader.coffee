#!/usr/bin/env NODE_PATH=$NODE_PATH:. ../node_modules/.bin/coffee

fs = require 'fs'
path = require 'path'
zlib = require 'zlib'

filesize = require 'filesize'

CLEAR = '\u001B[A\u001B[2K'

updateLoadingDisplay = (loaded, done) ->
	console.log "#{CLEAR} #{if done then '├' else '└'} size in RAM:  #{filesize(loaded)}"

parse = (json, callback) ->
	console.log " └ parsing..."
	start   = Date.now()
	tree    = JSON.parse(json)
	elapsed = (Date.now() - start) / 1000
	console.log "#{CLEAR} └ parsed in:    #{elapsed}s\n"
	callback(null, tree)

exports.load = (filename, callback) ->

	stat = fs.statSync(filename)
	compressed = path.extname(filename) == '.gz'

	console.log "\n#{path.basename(filename)}"
	console.log " ├ size on disk: #{filesize(stat.size)}#{if compressed then ' (gzipped)' else ''}\n"

	fileStream = fs.createReadStream(filename)
	readStream = fileStream

	if compressed
		gunzipStream = zlib.createGunzip()
		readStream = gunzipStream
		fileStream.pipe(gunzipStream)

	json = ''

	readStream.on 'data', (data) ->
		json += data
		updateLoadingDisplay(json.length)

	readStream.on 'end', ->
		updateLoadingDisplay(json.length, true)
		parse(json, callback)
