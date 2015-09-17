# Crotalus

[![CI Status](http://img.shields.io/travis/Draveness/Crotalus.svg?style=flat)](https://travis-ci.org/Draveness/Crotalus)
[![Version](https://img.shields.io/cocoapods/v/Crotalus.svg?style=flat)](http://cocoapods.org/pods/Crotalus)
[![License](https://img.shields.io/cocoapods/l/Crotalus.svg?style=flat)](http://cocoapods.org/pods/Crotalus)
[![Platform](https://img.shields.io/cocoapods/p/Crotalus.svg?style=flat)](http://cocoapods.org/pods/Crotalus)

Crotalus is an convenient and fast approach to create `AttributedString` in Swift. This library is inspired by [colorize](https://github.com/fazibear/colorize) which is a ruby gem colorize string.

If you would like to use chainable syntax in Objective-C use [Typeset](https://github.com/Draveness/Typeset) instead.

## With Crotalus

With Cratalus, you can create attributed string much more easier than other way.

```swift
"Hello".crotalus.color(0xff0000).match("He").color(0x00ff00).all.fontName("Sanrif").string
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Crotalus is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Crotalus"
```

## Author

Draveness, stark.draven@gmail.com

## License

Crotalus is available under the MIT license. See the LICENSE file for more info.
