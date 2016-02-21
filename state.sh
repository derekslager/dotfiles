#!/bin/sh
COMMAND=state.highstate
if [ -n "$1" ]; then
   COMMAND="state.sls $1"
fi
sudo salt-call --local --file-root=srv/salt --pillar-root=srv/pillar $COMMAND
