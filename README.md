NOTE
====

These are MY dotfiles, so you might want to remove some stuff you do not use.
And add your own stuff, obviously.

I won't guarantee that the install.sh script or any other files work for you,
I have mainly used these files with "Bourne-again shell" bash.

INSTALLING
==========

- Clone git repository to the path you want your dotfiles to
  eg. git clone http://foobar ~/.dotfiles
- Configure DOTFILES & APPDATA directory paths in the file "start"
- Run ''./install.sh'' or see what it does and do it manually

APPDATA
=======

$APPDATA directory should contain the files that you do not want to see
cluttering your $HOME directory. This means that you need to configure programs
to read/write files from/to this directory.

eg. I have Erlang reading VM arguments from $APPDATA/erlang/vm.args
I've done this by setting ERL_AFLAGS to "-args_file $APPDATA/erlang/vm.args"
in $DOTFILES/envs

PER MACHINE CONFIGURATION
=========================

- You can use ~/.localrc
- You can create the directory $DOTFILES/local/ add file named like your server
  eg. yourserver1.example.com there (see `hostname --fqdn` for your full
  qualified domain name)

If you want to keep your local configuration files in git, put them to
$DOTFILES/local/, otherwise use ~/.localrc

LAYOUT
======

<code>
./.gitignore	- stuff that git ignores
./aliases		- contains alises
./config		- main configuration file that runs other files, start sources
				this
./envs			- environment variables go here
./functions		- additional shell functions/subroutines/procedures
./inputrc		- inputrc
./paths			- path configuration (eg. for PATH and MANPATH envs)
./readme.md		- this file
./start			- start file, contains DOTFILES & APPDATA envs, sources ./config
./tmp			- file for temporary configuration that git should ignore
./temp			- same as ./tmp

shells/*		- shell RCs
shells/home/*	- shell RCs that are softlinked to $HOME by install

local/`hostname --fqdn`	- local configuration for the specific server
$HOME/.localrc			- local configuration for the specific server
</code>

TODO (a.k.a not going to happen)
================================

* Smarter install script.
* Test with dash & other shells
* Split appdata to configuration & state, maybe move them under $DOTFILES
  eg. history files are state that should not be in git
  and application configuration could be in git, but not all of it should be in
  git eg. Erlang secret cookies.
* Move screenrc, nanorc etc. under appdata
