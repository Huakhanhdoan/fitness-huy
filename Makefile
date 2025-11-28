pub_get:
	flutter pub get
code_gen_watch:
	flutter pub run build_runner watch --delete-conflicting-outputs
code_gen_build:
	flutter pub run build_runner build --delete-conflicting-outputs
gen_logo:
	flutter pub run flutter_launcher_icons
gen_splash:
	dart run flutter_native_splash:create
build_android_release:
	flutter build apk --release
build_android_bundle:
	flutter build appbundle --release
build_android_bundle_and_open_folder:
	flutter build appbundle --release && open build/app/outputs/bundle/release/
build_android_release_and_open_folder:
	flutter build apk --release && open build/app/outputs/flutter-apk/
build_ios_release:
	flutter build ios --release
build_ios_release_and_open_folder:
	flutter build ios --release && open build/ios/iphoneos/
run_android_release:
	flutter run --release
gen_launcher_icons:
	flutter pub run flutter_launcher_icons -f flutter_launcher_icons.yaml
clean_pub_get_build:
	flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
