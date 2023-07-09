# DeliveryApp

[![CI](https://github.com/joaolfp/DeliveryApp-iOS/actions/workflows/CI.yml/badge.svg)](https://github.com/joaolfp/DeliveryApp-iOS/actions/workflows/CI.yml)

Delivery App is a simple app that shows a list of available categories and restaurants and we will be evolving over time :rocket:

<img src="https://github.com/joaolfp/DeliveryApp-iOS/blob/main/Home/Tests/ReferenceImages/HomeViewControllerTests/HomeViewController__should_validate_layout_with_success%403x.png" width="310" height="640" />

## Knowledge Stack

* <b>Language:</b> Swift
* <b>Modules: Mult modules project with SPM</b>
* <b>Dependencies:</b> SPM
* <b>Architecture:</b> MVC
* <b>Network:</b> URLSession
* <b>Layout:</b> View Code (without Storyboard)
* <b>UnitTest:</b> Quick & Nimble
* <b>Snapshot Test: </b> Nimble-Snapshots
* <b>CI:</b> Github Action
* <b>Linters:</b> SwiftLint

## App structure

<img src="https://github.com/joaolfp/DeliveryApp-iOS/blob/main/Docs/img/Modules.png" height="450">

* <b>DeliveryApp:</b> Main module
* <b>Home:</b> Main screen of the app
* <b>Networking:</b> Network configuration of the whole app
* <b>Core:</b> All settings and code reusable
* <b>Design System:</b> All layout like colors, views and images
* <b>TestUtils:</b> Mocks and codes to help with unit tests

## License
DeliveryApp-iOS is released under the MIT license. See [LICENSE](https://github.com/joaolfp/DeliveryApp-iOS/blob/main/LICENSE) for details.
