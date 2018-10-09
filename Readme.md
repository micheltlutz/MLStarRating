# MLStarRating

<p align="center">
 <img width="300" height="300"src="http://micheltlutz.me/imagens/projetos/MLStarRating/logo.png">
</p>

[![Platforms](https://img.shields.io/cocoapods/p/MLStarRating.svg)](https://cocoapods.org/pods/MLStarRating)
[![License](https://img.shields.io/cocoapods/l/MLStarRating.svg)](https://raw.githubusercontent.com/micheltlutz/MLStarRating/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/MLStarRating.svg)](https://cocoapods.org/pods/MLStarRating)

[![Travis](https://img.shields.io/travis/micheltlutz/MLStarRating/master.svg)](https://travis-ci.org/micheltlutz/MLStarRating/branches)
[![SwiftFrameworkTemplate](https://img.shields.io/badge/SwiftFramework-Template-red.svg)](http://github.com/RahulKatariya/SwiftFrameworkTemplate)

Star Ratings for swift projects

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 10.0+  / tvOS 9.0+ 
- Xcode 9.0+

## Installation

### Dependency Managers
<details>
<summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate MLStarRating into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

pod 'MLStarRating', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
<summary><strong>Carthage</strong></summary>

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate MLStarRating into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "micheltlutz/MLStarRating" ~> 1.0
```

</details>

<details>
<summary><strong>Swift Package Manager</strong></summary>

To use MLStarRating as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:4.1

import PackageDescription

let package = Package(
name: "HelloMLStarRating",
dependencies: [
.package(url: "https://github.com/micheltlutz/MLStarRating.git", .upToNextMajor(from: "1.0"))
],
targets: [
.target(name: "HelloMLStarRating", dependencies: ["MLStarRating"])
]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate MLStarRating into your project manually.

<details>
<summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add MLStarRating as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/micheltlutz/MLStarRating.git
$ git submodule update --init --recursive
```

- Open the new `MLStarRating` folder, and drag the `MLStarRating.xcodeproj` into the Project Navigator of your application's Xcode project.

> It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `MLStarRating.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `MLStarRating.xcodeproj` folders each with two different versions of the `MLStarRating.framework` nested inside a `Products` folder.

> It does not matter which `Products` folder you choose from.

- Select the `MLStarRating.framework`.

- And that's it!

> The `MLStarRating.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
<summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/micheltlutz/MLStarRating/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `MLStarRating.framework`.
- And that's it!

</p></details>

## Usage

### You need two image files with named in your Assets 

- emptyStar
- fullStar

```swift

import MLStarRating

let mlStarRating = MLStarRating()
mlStarRating.didChangeStar = { starCount in
	print("Star selected: \(starCount)")
}
```

### You can Change the image name 
```swift
let mlStarRating = MLStarRating()
mlStarRating.emptyStarImageName = "string name image"
mlStarRating.fullStarImageName = "string name image"
mlStarRating.setupStars() // to change configuration buttons
```


## Contributing

Issues and pull requests are welcome!


## Docs

See [Documentation](http://htmlpreview.github.io/?https://github.com/micheltlutz/MLStarRating/blob/develop/docs/index.html)

MLLineChart Docs (80% documented)

<p align="center">
 <img width="350" height="77"src="http://micheltlutz.me/imagens/projetos/MLStarRating/IMG_4648.jpg"> 
</p>

## Todo

- [ ] Migrate to Swift 4.2
- [ ] 100% documented


## Author

Michel Anderson Lutz Teixeira [@michel_lutz](https://twitter.com/michel_lutz)

## License

MLStarRating is released under the MIT license. See [LICENSE](https://github.com/micheltlutz/MLStarRating/blob/master/LICENSE) for details.
