**jwalk** provides an easy way to inspect the object tree created by a JSON file via the command line.
The interface provided is a lot like a typical shell, with familiar commands like `cd` and `ls`.

## Installation

More documentation (and fewer bugs) coming soon. In the meantime, install it via npm:

```
npm install -g jwalk
```

## Running
And then run it like this:

```
jwalk somefile.json
```

It can also handle gzipped files. If the extension is .gz, it will decompress the JSON data automatically.

```
jwalk somefile.json.gz
```

## Possible Commands

Given the following json file

````javascript
{
  "name": "jwalk",
  "version": "0.0.4",
  "description": "command-line json inspector",
  "preferGlobal": "true",
  "repositories": {
    "type": "git",
    "url": "http://github.com/nkohari/jwalk"
  },
  "bin": {
    "jwalk": "bin/jwalk"
  },
  "dependencies": {
    "coffee-script": "1.4.0",
    "colors": "0.6.0-1",
    "filesize": "1.6.6",
    "underscore": "1.4.2"
  },
  "engine": "node >= 0.8.x"
}
````

## Help

Shows this help message

```
jwalk obj{8} / $ help

cd navigates through nodes in the tree
clear clears the screen
cls clears the screen
exit quit jwalk
help shows this help message
key sexamines the keys of an object node
ls examines a single node
quit quit jwalk
```

## List

Examines the current node

```
jwalk obj{8} / $ ls
{ name: 'jwalk',
  version: '0.0.4',
  description: 'command-line json inspector',
  preferGlobal: 'true',
  repositories: 
   { type: 'git',
     url: 'http://github.com/nkohari/jwalk' },
  bin: { jwalk: 'bin/jwalk' },
  dependencies: 
   { 'coffee-script': '1.4.0',
     colors: '0.6.0-1',
     filesize: '1.6.6',
     underscore: '1.4.2' },
  engine: 'node >= 0.8.x' }
```

## Change Directory

Allows navigation through the JSON tree. Note 'cd' does support autocomplete by pressing the tab key.

```
jwalk obj{8} / $ cd dependencies
jwalk obj{4} /dependencies $ ls
{ 'coffee-script': '1.4.0',
  colors: '0.6.0-1',
  filesize: '1.6.6',
  underscore: '1.4.2' }
```

## Clear

Clears the screen

```
jwalk obj{8} / $ clear
```
or

```
jwalk obj{8} / $ cls
```

## Keys

Examines the keys of an object node

```
jwalk obj{8} / $ keys
[ 'name',
  'version',
  'description',
  'preferGlobal',
  'repositories',
  'bin',
  'dependencies',
  'engine' ]
```

## Quit

Exits the jwalk application

```
jwalk obj{8} / $ exit
```
or

```
jwalk obj{8} / $ quit
```

## Preferences File

You can create a JSON file at `~/.jwalk` to define preferences. Right now, all it supports is defining aliases for commands, like so:

```json
{
  "aliases": {
    "l": "ls"
  }
}
```

## Contributing

Bug reports and pull requests welcome!
