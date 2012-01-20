Nick's vimfiles
===============

Installation
------------

Clone with repository (with submodules) to a local tree:

    git clone --recursive https://github.com/nickjones/vimfiles.git nickjones-vimfiles

Merge my settings with your own by adding this to your existing .vimrc file:

    set runtimepath^=$HOME/path/to/nickjones-vimfiles
    runtime vimrc

After those lines, any changes in your .vimrc file will override settings from this repository.

Updating
--------

Since I directly linked to other GitHub repos through submodules, pulling updates requires a slight tweak:

    git pull --recurse-submodules

Optionally, set git to always recurse submodules on a fetch/pull by setting an option

    git config fetch.recurseSubmodules=true
    
and then always using a standard pull or fetch

    git pull
    
If git throws an error about an unknown option of 'recurse-submodules', manually update submodules with

    git submodule update

Contributing
------------

I'm always open to suggestions on better ways to do something but most likely you'll
just want to fork my repo and setup your own version.

Contact
-------

[GitHub](https://github.com/inbox/new?to=nickjones)

[Twitter](http://twitter.com/nicktj)
