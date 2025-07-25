#!/bin/bash

# Increment patch version and build number in pubspec.yaml
PUBSPEC_FILE="pubspec.yaml"
VERSION_LINE=$(grep '^version:' $PUBSPEC_FILE)

if [[ $VERSION_LINE =~ ([0-9]+)\.([0-9]+)\.([0-9]+)\+([0-9]+) ]]; then
  MAJOR=${BASH_REMATCH[1]}
  MINOR=${BASH_REMATCH[2]}
  PATCH=${BASH_REMATCH[3]}
  BUILD=${BASH_REMATCH[4]}

  # Increment patch version and build number
  NEW_PATCH=$((PATCH + 1))
  NEW_BUILD=$((BUILD + 1))
  NEW_VERSION_LINE="version: $MAJOR.$MINOR.$NEW_PATCH+$NEW_BUILD"

  # Replace the version line in pubspec.yaml
  sed -i '' "s/^version: .*/$NEW_VERSION_LINE/" $PUBSPEC_FILE
  echo "Updated version to $MAJOR.$MINOR.$NEW_PATCH+$NEW_BUILD"
else
  echo "Could not parse version from pubspec.yaml."
  exit 1
fi

# Prompt for build flavor
read -p "Select build flavor (production/staging): " FLAVOR

# Validate flavor
if [[ "$FLAVOR" != "production" && "$FLAVOR" != "staging" ]]; then
  echo "Invalid flavor. Please enter 'production' or 'staging'."
  exit 1
fi

# Prompt for platform
read -p "Select platform (android/ios/both): " PLATFORM

# Validate platform
if [[ "$PLATFORM" != "android" && "$PLATFORM" != "ios" && "$PLATFORM" != "both" ]]; then
  echo "Invalid platform. Please enter 'android', 'ios', or 'both'."
  exit 1
fi

# Set target file
if [[ "$FLAVOR" == "production" ]]; then
  TARGET="lib/main_prod.dart"
else
  TARGET="lib/main_stag.dart"
fi

# Run the appropriate build command(s)
if [[ "$PLATFORM" == "ios" ]]; then
  flutter build ipa --flavor $FLAVOR --target $TARGET
elif [[ "$PLATFORM" == "android" ]]; then
  flutter build appbundle --flavor $FLAVOR --target $TARGET
elif [[ "$PLATFORM" == "both" ]]; then
  flutter build ipa --flavor $FLAVOR --target $TARGET && flutter build appbundle --flavor $FLAVOR --target $TARGET
fi
