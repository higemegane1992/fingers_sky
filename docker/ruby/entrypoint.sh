#!/bin/bash
set -e

rm -f /fingers_sky/tmp/pids/server.pid

exec "$@"
