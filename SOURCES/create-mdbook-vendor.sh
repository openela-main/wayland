#!/bin/sh

set -e

if [ -z "$1" ]; then
    MDBOOK_VERSION="0.5.3"
else
    MDBOOK_VERSION="$1"
fi

# Download mdbook source
wget https://github.com/rust-lang/mdBook/archive/refs/tags/v$MDBOOK_VERSION/mdBook-$MDBOOK_VERSION.tar.gz
tar xf mdBook-$MDBOOK_VERSION.tar.gz
pushd mdBook-$MDBOOK_VERSION

# Create vendor tarball
cargo vendor
tar -cJf ../mdBook-$MDBOOK_VERSION-vendor.tar.xz vendor/
rm -Rf mdBook-$MDBOOK_VERSION
popd
