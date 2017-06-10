#!/usr/local/bin/bash
file=$1
curl --upload-file $file https://transfer.sh/$file
