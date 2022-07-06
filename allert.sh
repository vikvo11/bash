#!/bin/bash

logfile=/var/lib/mysql/error.log
oldlogfile=/var/lib/mysql/error.log.old
email=your@mail.box.here

if [ -f $oldlogfile ]; then
  diff $oldlogfile $logfile | grep ERROR > /dev/null
  if [ $? -eq 0 ]; then
    diff $oldlogfile $logfile | grep ERROR | mail -s 'last hour mysql errors' $email
  fi
fi
cp -p $logfile $oldlogfile
