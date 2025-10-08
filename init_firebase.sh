
if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'staging', 'production',"
  exit 1
fi

case $1 in
 
  staging)
    flutterfire config \
      --project=flutter-template-b6f33 \
      --out=lib/firebase_options_staging.dart \
      --ios-bundle-id=app.net17.staging \
      --ios-out=ios/flavors/staging/GoogleService-Info.plist \
      --android-package-name=app.net17.flutter_app.stag \
      --android-out=android/app/src/staging/google-services.json
    ;;
  production)
    flutterfire config \
      --project=flutter-template-b6f33 \
      --out=lib/firebase_options.dart \
      --ios-bundle-id=app.net17.template.prod \
      --ios-out=ios/flavors/production/GoogleService-Info.plist \
      --android-package-name=app.net17.flutter_app.prod \
      --android-out=android/app/src/production/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'staging', or 'production'."
    exit 1
    ;;
esac