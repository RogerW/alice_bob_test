#!/bin/bash
set -e

echo "Environment: $RAILS_ENV"

# Remove a potentially pre-existing server.pid for Rails.
if [ -f /var/app/tmp/pids/server.pid ]; then
  rm /var/app/tmp/pids/server.pid
fi

bundle check || bundle install --jobs 10 --retry 5

${@}
