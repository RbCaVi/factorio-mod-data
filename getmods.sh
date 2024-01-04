#!/bin/bash
processpath=$(realpath lua-factorio-data/process.sh)
rootpath=$(realpath .)

if [[ ! -d factorio ]]; then 
  rm -f factorio.tar.xz
  rm -fr factorio
  wget --progress=dot:giga 'https://factorio.com/get-download/latest/demo/linux64' -O factorio.tar.xz
  tar -xJf factorio.tar.xz
fi

echo "$rootpath/factorio" > factorioroot.txt

for file in *.json; do
  packname="${file%.json}"
  rm -fr "packs/$packname"
  mkdir -p "packs/$packname"
  pushd "packs/$packname"
    cp "$rootpath/$file" ./pack.json
    cp "$rootpath/factorioroot.txt" .
    bash "$processpath" "$packname"
  popd
done
