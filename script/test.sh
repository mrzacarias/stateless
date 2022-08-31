#!/bin/sh

set -e

cd "$(dirname "$0")/.."

[ -z "$DEBUG" ] || set -x

echo "==> Running stateless tests…"
if [ -n "$1" ]; then
  testdir="/$*"
fi

docker-compose run --rm -e STL_PORT=8080 web go test -cover -race .$testdir/...
