#!/bin/bash
rootpath=$(realpath .)


for file in `ls packs`; do
  name=$(cat "packs/$file/pack.json"|jq '.name')
  cp -r "packs/$file/$name" "$rootpath/SEJS/$file"
done

cp modsjson.txt "$rootpath/SEJS/mods.json"
