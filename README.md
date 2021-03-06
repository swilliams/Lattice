# Lattice

![Lattice: Boilerplate Removal Library](http://tallwave.github.io/Lattice/assets/Lattice.png)

[![Build Status](https://travis-ci.org/Tallwave/Lattice.svg)](https://travis-ci.org/Tallwave/Lattice)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/Lattice.svg)](https://img.shields.io/cocoapods/v/Lattice.svg)


*An interlaced structure or pattern fastened together, used typically as support.*

A lot of iOS development is boilerplate code. How many times have you written code to restrict the length of text in a `UITextField`? How many more times do you want to do that? Yeah, me too.

Lattice aims to extract all that code into a group of reusable classes, or "Behaviors" that can be combined to quickly provide a ton of functionality to various UI classes.

Further, inheritance chains can get brittle. Once you get more than one or two generations in you always discover a scenario that you didn't originally think about. You might even find yourself thinking, "Well if Swift just had multiple inheritance...". That way leads to madness though, so Lattice favors composition over inheritance. You can combine multiple behaviors. This does mean that you can shoot yourself in the foot if you do something like adding a `MinLengthValidator` of 10 and a `MaxLengthValidator` of 5. Workaround: don't do that.

Here's the good part. Each of these Behaviors is designed to be dropped into Interface Builder as plain old objects. Once you wire a couple of `IBOutlet`s up, you're done. This means that your View Controllers are not cluttered up with dumb stuff like Validation and field operators. 

This was implemented around Storyboards. It might work with regular old Xibs, but maybe not.

A big thank you to [Krzysztof Zabłocki](http://www.objc.io/issues/13-architecture/behaviors/) for the idea. I ported over some of his code to Swift.

## Installation
Lattice is compatible with [CocoaPods](http://cocoapods.org) (a dependency manager for Xcode projects).

You can use embedded frameworks with Swift projects in CocoaPods 0.36. You can install it with the following command:

```bash
$ gem install cocoapods
```

To use Lattice in your Xcode project, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Lattice', '~> 0.1'
```

Then, run the following command:

```bash
$ pod install
```

## Usage
In Interface Builder, find the "Object" object in the Object Library Inspector (you can press ⌃⌥⌘3 to bring it up). Drag that onto your scene. You can drop it in the Document Outline or in the top bar of the View Controller, next to the First Responder icon.

In the Identity Inspector (⌥⌘3) change the Class field to whichever behavior you are using.

Connect the Outlets on the Behavior (right click on the Behavior, or use the Connections inspector, ⌥⌘6). You'll need to connect the [owner] property and at least one to the view you are manipulating. Some Behaviors are more complex and may need additional connections. Refer to the Behaviors documentation for further details.

That's it! 

# Contribution
1. Fork this project.
2. Make changes.
3. Submit a Pull Request.

[Here's some details about the GitHub workflow](http://blog.swilliams.me/words/2015/06/30/basic-github-workflow-for-collaboration/).
