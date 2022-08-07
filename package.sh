#!/bin/sh
set -eu
tag=$(git describe --tags)
version=${tag%%-*}

for type in deb "$@"; do
    fpm --input-type dir --output-type "${type}" --depends "tor" --architecture all -C package/ -n "$(basename `git rev-parse --show-toplevel`)" --version "${version}"
done