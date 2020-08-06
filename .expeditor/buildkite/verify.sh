#!/bin/bash

set -ueo pipefail

export AZURE_SUBSCRIPTION_ID=placeHolder
export AZURE_CLIENT_ID=placeHolder
export AZURE_TENANT_ID=placeHolder
export AZURE_CLIENT_SECRET=placeHolder

echo "--- system details"
uname -a
ruby -v
bundle --version

echo "--- bundle install"
bundle install --jobs=7 --retry=3 --without tools maintenance deploy
bundle update

echo "+++ bundle exec rake lint"
bundle exec rake lint

echo "+++ bundle exec rake test:unit"
bundle exec rake test:unit
