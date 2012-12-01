**jwalk** provides an easy way to inspect the object tree created by a JSON file via the command line.
The interface provided is a lot like a typical shell, with familiar commands like `cd` and `ls`.

More documentation (and fewer bugs) coming soon. In the meantime, install it via npm:

```
npm install -g jwalk
```

And then run it like this:

```
jwalk somefile.json
```

It can also handle gzipped files. If the extension is .gz, it will decompress the JSON data automatically.

```
jwalk somefile.json.gz
```

Bug reports and pull requests welcome!