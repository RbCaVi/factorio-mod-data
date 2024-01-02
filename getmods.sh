#!/bin/bash
processpath=$(realpath lua-factorio-data/process.sh)
rootpath=$(realpath .)

if [[ ! -d factorio ]]; then 
  rm -f factorio.tar.xz
  rm -fr factorio
  wget 'https://factorio.com/get-download/latest/demo/linux64' -O factorio.tar.xz
  tar -xJf factorio.tar.xz
  echo "$rootpath/factorio" > factorioroot.txt
fi

for file in *.json; do
  packname="${file%.json}"
  rm -fr "packs/$packname"
  mkdir -p "packs/$packname"
  cd "packs/$packname"
  cp "$rootpath"/"$file" ./pack.json
  cp "$rootpath"/factorioroot.txt .
  bash "$processpath" "$packname"
done