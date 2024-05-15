#!/bin/bash
rootpath=$(realpath .)


for file in `ls packs`; do
  cp -r "packs/$file" "$rootpath/SEJS/"
done

cp modsjson.txt "$rootpath/SEJS/mods.json"
