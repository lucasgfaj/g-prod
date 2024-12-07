#!/bin/sh
set -e

echo "Running db:create..."
bundle exec rails db:create
echo "Running db:migrate..."
bundle exec rails db:migrate

# Inicia o servidor Rails
exec bundle exec rails server -b '0.0.0.0'
