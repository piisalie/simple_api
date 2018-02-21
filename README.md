# LoneStar 2018 - SimpleApi

An Example Application for exploring how to build releases at LoneStar Elixir 2018

## Notable Docs

[erl runtime options](http://erlang.org/doc/man/erl.html)

[boot scripts](http://erlang.org/doc/man/script.html)

[Release Resource File](http://erlang.org/doc/design_principles/release_structure.html)

[Systools](http://erlang.org/doc/man/systools.html)

[Application Resource File](http://erlang.org/doc/man/app.html)

## Setup

```
git clone git@github.com:piisalie/simple_api.git
cd simple_api
./setup 0.1.0
cd playground
```

## Helpful ERL flags

* -noshell (start without the erlang shell)
* -pa <directory> (path add, add a directory to the load path)
* -boot <path to file> (sithout the .boot suffix)
* -compile <path to file> (compile a file)
* -s <module> <function> (execute a a function on start up)
* -extra (pass extra arguments from commandline into functions)
* -config <path to file> (specify a config file)
* -args_file <path to file> (specify a vm.args file)
* -app_name var value (add a variable and value to app_name's application config)
