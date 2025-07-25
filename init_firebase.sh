
if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'staging', 'production',"
  exit 1
fi

case $1 in
 
  staging)
    flutterfire config \
      --project=flutter-ship-stg \
      --out=lib/firebase_options_stg.dart \
      --ios-bundle-id=com.codewithandrea.flutterShipApp.stg \
      --ios-out=ios/flavors/stg/GoogleService-Info.plist \
      --android-package-name=com.codewithandrea.flutter_ship_app.stg \
      --android-out=android/app/src/stg/google-services.json
    ;;
  production)
    flutterfire config \
      --project=flutter-ship-prod \
      --out=lib/firebase_options_prod.dart \
      --ios-bundle-id=com.codewithandrea.flutterShipApp \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=com.codewithandrea.flutter_ship_app \
      --android-out=android/app/src/prod/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'stg', or 'prod'."
    exit 1
    ;;
esac