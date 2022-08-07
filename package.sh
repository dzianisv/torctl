#!/bin/sh
set -eu
for type in deb "$*"; do
    fpm --input-type dir --output-type "${type}" --depends curl --architecture all -C package/ -n "$(basename `git rev-parse --show-toplevel`)" --version "$(git describe --tags)"
done