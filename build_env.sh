#!/bin/bash -x

xcrun simctl shutdown all
sh launch-ios-simulator.sh 'iPhone 8'
bundle install