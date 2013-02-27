#!/bin/bash

# USAGE: crxmaker [options] <dir>

OPTERR=0

while getopts :p: opt; do
  case $opt in
    p)
      PEM=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

shift $((OPTIND-1))
DIR=$1
google-chrome --pack-extension="$DIR" ${PEM:+--pack-extension-key="$PEM"}
