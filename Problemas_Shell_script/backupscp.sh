#!/bin/bash
date=`date +%F`
tar -czf backupASO-$date.tar.gz /home/liquidator007/myBashScripts
scp backupASO-$date.tar.gz liquidator007@172.16.11.88:/home/liquidator007/

