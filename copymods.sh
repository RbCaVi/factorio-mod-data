#!/bin/bash
rootpath=$(realpath .)


for file in packs/*/; do
  pushd "$file"
    cp -r * "$rootpath/SEJS"
  popd
done
