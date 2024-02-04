# DeliveryApp

[![CI](https://github.com/joaolfp/DeliveryApp-iOS/actions/workflows/CI.yml/badge.svg)](https://github.com/joaolfp/DeliveryApp-iOS/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/joaolfp/DeliveryApp-iOS/graph/badge.svg?token=RYTP12HMY7)](https://codecov.io/gh/joaolfp/DeliveryApp-iOS)
[![License](https://img.shields.io/github/license/joaolfp/DeliveryApp-iOS.svg)]([https://github.com/joaolfp/ViewState/blob/master/LICENSE](https://github.com/joaolfp/DeliveryApp-iOS/blob/main/LICENSE))

<img src="https://github.com/joaolfp/DeliveryApp-iOS/blob/main/Docs/img/logo.png" alt="DeliveryApp logo" title="The logo himself" align="right" width="150" height="150">

Delivery App is a simple app that shows a list of available categories and restaurants and we will be evolving over time :rocket:

<img src="https://github.com/joaolfp/DeliveryApp-iOS/blob/main/Home/Tests/HomeTests/Screens/Home/__Snapshots__/HomeViewControllerTests/testShouldValidateLayoutWithSuccess.1.png?raw=true" width="310" height="680" />

## Knowledge Stack

* <b>Language:</b> Swift
* <b>Modules:</b> Mult modules project with SPM
* <b>Dependencies:</b> SPM
* <b>Architecture:</b> MVVM
* <b>Network:</b> URLSession
* <b>Layout:</b> View Code (without Storyboard) & SwiftUI
* <b>UnitTest:</b> XCTest
* <b>Snapshot Test: </b> SnapshotTesting
* <b>CI:</b> Github Action
* <b>Linters:</b> SwiftLint
* <b>Test coverage:</b> Codecov

## App structure

* <b>DeliveryApp:</b> Main module
* <b>Authentication:</b> Validates FaceID or TouchID
* <b>Home:</b> Main screen
* <b>Address:</b> For the user to select the address
* <b>Persistence:</b> Save local information
* <b>Networking:</b> Network configuration of the whole app
* <b>Core:</b> All settings and code reusable
* <b>Coordinator:</b> Navigation structure
* <b>Design System:</b> All layout like colors, views and images
* <b>TestUtils:</b> Mocks and codes to help with unit tests
* <b>Analytics:</b> Help troubleshoot problems and monitor failure data with more granularity

## How to build the app

Open <b>DeliveryApp.xcodeproj</b>

To run the tests locally you can use fastlane

```
bundle exec fastlane tests
```

## License
DeliveryApp-iOS is released under the MIT license. See [LICENSE](https://github.com/joaolfp/DeliveryApp-iOS/blob/main/LICENSE) for details.
