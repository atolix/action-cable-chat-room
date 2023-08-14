#!/bin/bash
set -e

rm -f /action-cable-chat-room/tmp/pids/server.pid

exec "$@"
