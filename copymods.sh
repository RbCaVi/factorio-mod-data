#!/bin/bash
rootpath=$(realpath .)


for file in `ls packs`; do
  name=$(cat "packs/$file/pack.json"|jq -r '.name')
  mv "packs/$file/$name" "$rootpath/SEJS/$file"
done

cp modsjson.txt "$rootpath/SEJS/mods.json"
