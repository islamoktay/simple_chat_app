#!/bin/bash
set -e

# https://flutter.dev/docs/development/data-and-backend/json#generating-code-continuously
flutter pub run build_runner build --delete-conflicting-outputs
