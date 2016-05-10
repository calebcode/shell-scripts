#!/bin/ksh

# this script compresses all files in the target directory older than 3 months, and
# then deletes all files that are a year old.

# run from cron...do not keep in the directory you want to prune
# usage: ./prune_logs.sh /path/to/log/directory

prunedir=$1

# gzip all log files that are 3 months old in this directory
find $prunedir -mtime +91 -exec gzip {} +

# delete files that are older than 1 year
find $prunedir -mtime +366 -exec rm {} +
