#!/bin/bash
rootpath=$(realpath .)


for file in `ls packs`; do
  pushd "packs/$file"
    cp -r mod "$rootpath/SEJS/$file"
  popd
done
