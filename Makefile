test:
	set -o pipefail
	xcodebuild -project DeliveryApp.xcodeproj \
           -scheme DeliveryApp \
           -destination platform=iOS\ Simulator,name=iPhone\ 14 \
           clean test | xcpretty

build:
	set -o pipefail
	xcodebuild -project DeliveryApp.xcodeproj \
           -scheme DeliveryApp \
           -destination platform=iOS\ Simulator,name=iPhone\ 14 \
           build | xcpretty
