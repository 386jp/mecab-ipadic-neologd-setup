#!/bin/bash

brew install mecab
git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
cd mecab-ipadic-neologd
./bin/install-mecab-ipadic-neologd -n -y
sudo sed -i '.bak' 's/dicdir/\;dicdir/' /opt/homebrew/etc/mecabrc
sudo echo "dicdir = /opt/homebrew/lib/mecab/dic/mecab-ipadic-neologd" >> /opt/homebrew/etc/mecabrc
cd ../
rm -rf mecab-ipadic-neologd
