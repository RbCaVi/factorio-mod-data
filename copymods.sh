#!/bin/bash
rootpath=$(realpath .)


for file in `ls packs`; do
  cp -r "packs/$file" "$rootpath/SEJS/$file"
done

cp modsjson.txt "$rootpath/SEJS/mods.json"