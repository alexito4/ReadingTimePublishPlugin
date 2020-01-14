# PublishReadingTime


<a href="https://github.com/alexito4/ReadingTimePublishPlugin/actions?query=workflow%3ATest+branch%3Amaster
">
    <img src="https://github.com/alexito4/ReadingTimePublishPlugin/workflows/Test/badge.svg?branch=master" alt="Status" />
</a>
![Swift 5.1](https://img.shields.io/badge/Swift-5.1-orange.svg)
<a href="https://swift.org/package-manager">
    <img src="https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
</a>
![Mac & Linux](https://img.shields.io/badge/platforms-mac+linux-brightgreen.svg?style=flat)
<a href="https://github.com/JohnSundell/Publish">
    <img src="https://img.shields.io/badge/Publish-Plugin-orange.svg?style=flat" alt="Publish Plugin" />
</a>
<a href="https://twitter.com/alexito4">
    <img src="https://img.shields.io/badge/twitter-@alexito4-blue.svg?style=flat" alt="Twitter: @alexito4" />
</a>

Reading time estimation plugin for [Publish](https://github.com/JohnSundell/Publish).

## Installation

## Usage

The plugin can then be used within any publishing pipeline like this:

```swift
import PublishReadingTime
...
try DeliciousRecipes().publish(using: [
    ...
    .addMarkdownFiles(),
    .installPlugin(.readingTime()),
    ...
])
```
Note that it must be installed after the Items are created (in this case by `addMarkdownFiles()` ).

Then you can add the information on your Theme:

```swift
HTML(...
.p("\(item.readingTime.minutes) minutes"),
...
```

# Author

Alejandro Martinez | http://alejandromp.com | [@alexito4](https://twitter.com/alexito4)
