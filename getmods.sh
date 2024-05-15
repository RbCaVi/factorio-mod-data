#!/bin/bash
processpath=$(realpath lua-factorio-data/process.mjs)
rootpath=$(realpath .)

if [[ ! -d factorio ]]; then 
  rm -f factorio.tar.xz
  rm -fr factorio
  wget --progress=dot:giga 'https://factorio.com/get-download/latest/demo/linux64' -O factorio.tar.xz
  tar -xJf factorio.tar.xz
fi

echo "$rootpath/factorio" > factorioroot.txt

npm i yauzl@2.10.0

for file in *.json; do
  packname="${file%.json}"
  rm -fr "packs/$packname"
  mkdir -p "packs/$packname"
  cp "$file" "packs/$packname/pack.json"
  pushd "packs/$packname"
    cp "$rootpath/factorioroot.txt" .
    node "$processpath"
  popd
done
