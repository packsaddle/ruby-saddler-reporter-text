#!/bin/bash

cat ../test/fixtures/too_long.xml | bundle exec saddler report --reporter Saddler::Reporter::Text
cat ../test/fixtures/no_error.xml | bundle exec saddler report --reporter Saddler::Reporter::Text
