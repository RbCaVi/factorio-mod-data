#!/bin/bash
rootpath=$(realpath .)

mkdir assets

for file in `ls packs`; do
  name=$(cat "packs/$file/pack.json"|jq -r '.name')
  mv -T "packs/$file/$name" "assets/$file"
done

mkdir modassets
mv -ft modassets assets/*/assets/* # move the assets for all the mods to one folder
rmdir assets/*/assets
mv -T modassets assets/assets # put them in assets/ for github pages
