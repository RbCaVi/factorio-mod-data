#!/bin/bash
rootpath=$(realpath .)

mkdir -p "assets"

for file in `ls packs`; do
  name=$(cat "packs/$file/pack.json"|jq -r '.name')
  mv "packs/$file/$name" "$rootpath/assets/$file"
done

cp modsjson.txt "$rootpath/assets/mods.json"
