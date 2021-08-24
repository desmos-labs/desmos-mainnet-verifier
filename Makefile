FILES=-name '*.dart' -not -name '*.g.dart' -not -path '*/dart_tool/*' -not -path '*/build/*' -not -path '*/generated/*' -not -path '*/proto/*' -not -name "*localizations*.dart"

lint:
	find . $(FILES) | tr '\n' ' ' | xargs flutter format --dry-run --set-exit-if-changed
	flutter analyze

format:
	find . $(FILES) | tr '\n' ' ' | xargs flutter format

generate-lib:
	cargo make
	mv -f target/aarch64-linux-android/debug/libwallet_ffi.so packages/wallet/android/src/main/jniLibs/arm64-v8a/
	mv -f target/armv7-linux-androideabi/debug/libwallet_ffi.so packages/wallet/android/src/main/jniLibs/armeabi-v7a/
	mv -f target/i686-linux-android/debug/libwallet_ffi.so packages/wallet/android/src/main/jniLibs/x86/

build-docker:
	flutter build web --release
	docker build --build-arg UID=$(shell id -u) --build-arg GID=$(shell id -g) -f ./Dockerfile --tag desmoslabs/mainnet-verifier build/web

.PHONY: lint format generate-lib build-docke
