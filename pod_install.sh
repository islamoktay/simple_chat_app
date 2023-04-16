#!/bin/bash
set -e

cd ios

pod update
pod install
