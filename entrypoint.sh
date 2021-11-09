#!/bin/bash
set -e

# Remove existing server.pid
rm -f /hotlinebe/tmp/pids/server.pid

# Start app
exec "$@"
