# Overview

Derek Slager's salted dotfiles repository. Configuration is managed
via SaltStack, and is intended to work on OS X, Windows and Linux.

# Requirements

SaltStack version 2014.7.0 or newer must be installed. On Mac OS X,
you will need at least version 2014.7.1. This release is not stable as
of this writing, but you can run from Homebrew HEAD in the interim:

    $ brew install saltstack --HEAD

You do not need to run `salt-master` or `salt-minion`, this runs
entirely standalone.

# Installation

Clone the repository locally under your `$HOME` directory.

    $ cd; git clone https://github.com/derekslager/dotfiles

Once cloned, run the following command. Edit `srv/salt/top.sls` to
select which customizations are applied. To configure states other
than `emacs`, you will need to create pillar files. These are not
currently available in the repository.

    $ ./highstate.sh
