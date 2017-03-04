#!/bin/bash

DEST='/backup'
MACHINE='1.2.3.4'
FILENAME=home_$(date +%m_%Y)
LINKDEST=`tail -n1 $DEST/backup.log`

# Stop script when machine is not online
if ! ping -c 1 $MACHINE &> /dev/null; then echo 'machine not available'; exit 1; fi

# Stop script when backup is already there
if [ $LINKDEST == $DEST/$FILENAME/ ]; then exit 1; fi

rsync -vai --delete --include-from=$DEST/rsync.whitelist $MACHINE:/ $DEST/$FILENAME/ --link-dest=$LINKDEST
echo $DEST/$FILENAME/ >> $DEST/backup.log
