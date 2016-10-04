#!/usr/bin/env bash
set -e

url='https://www.dropbox.com/download?plat=lnx.x86_64'

cd "$HOME"
[ -x .dropbox-dist/dropboxd ] || {
    echo "Downloading and unpacking Dropbox client..."
    curl -s -S -L "$url" | tar xzf -
}
echo "To synchronize your Dropbox, run: .dropbox-dist/dropboxd"
echo "(You can run this in the background after you've set up access.)"
