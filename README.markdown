Nick's vimfiles
===============

Installation
------------

Clone with repository (with submodules) to a local tree:

    git clone --recursive https://github.com/nickjones/vimfiles.git nickjones-vimfiles

Option 1:

If you have an existing .vimrc file and .vim folder, move them out of the way:

    mv ~/.vimrc ~/.vimrc.orig
    mv ~/.vim ~/.vim.orig

Symbolically link the git repository copies:

    ln -s /path/to/nickjones-vimfiles/.vimrc ~/.vimrc
    ln -s /path/to/nickjones-vimfiles/.vim ~/.vim
    
Option 2:

Merge my settings with your own by adding this to your existing .vimrc file:

    set runtimepath^=$HOME/path/to/nickjones-vimfiles/.vim
    runtime vimrc

After those lines, any changes in your .vimrc file will override settings from this repository.

Updating
--------

Since I directly linked to other GitHub repos, pulling updates requires a slight tweak:

    git pull --recurse-submodules

Contributing
------------

I'm always open to suggestions on better ways to do something but most likely you'll
just want to fork my repo and setup your own version.

Contact
-------

[GitHub](https://github.com/inbox/new?to=nickjones)

[Twitter](http://twitter.com/nicktj)
