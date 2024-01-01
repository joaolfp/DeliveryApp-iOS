test:
	set -o pipefail
	xcodebuild -project DeliveryApp.xcodeproj \
           -scheme DeliveryApp \
           -destination platform=iOS\ Simulator,OS=17.2,name=iPhone\ 15 \
           clean test | xcpretty

build:
	set -o pipefail
	xcodebuild -project DeliveryApp.xcodeproj \
           -scheme DeliveryApp \
           -destination platform=iOS\ Simulator,OS=17.2,name=iPhone\ 15 \
           build | xcpretty
