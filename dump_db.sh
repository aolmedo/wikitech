#!/bin/sh
path="/home/ubuntu/backups_db"
dbname="formosa"
date=`date +"%Y%m%d_%H%M%N"`
filename="${path}/${dbname}_${date}.gz"
pg_dump $dbname | gzip > $filename
