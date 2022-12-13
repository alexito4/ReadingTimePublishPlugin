# PublishReadingTime


<a href="https://github.com/alexito4/ReadingTimePublishPlugin/actions?query=workflow%3ATest+branch%3Amaster
">
    <img src="https://github.com/alexito4/ReadingTimePublishPlugin/workflows/Test/badge.svg?branch=master" alt="Status" />
</a>
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Falexito4%2FReadingTimePublishPlugin%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/alexito4/ReadingTimePublishPlugin)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Falexito4%2FReadingTimePublishPlugin%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/alexito4/ReadingTimePublishPlugin)
<a href="https://github.com/JohnSundell/Publish">
    <img src="https://img.shields.io/badge/Publish-Plugin-orange.svg?style=flat" alt="Publish Plugin" />
</a>
<a href="https://twitter.com/alexito4">
    <img src="https://img.shields.io/badge/twitter-@alexito4-blue.svg?style=flat" alt="Twitter: @alexito4" />
</a>

Reading time estimation plugin for [Publish](https://github.com/JohnSundell/Publish).

## Installation

Start by adding the dependency to your project:

```swift
    dependencies: [
        ...
        .package(name: "ReadingTimePublishPlugin", url: "https://github.com/alexito4/ReadingTimePublishPlugin", from: "0.2.0")
    ],
```

Then assign it to your target:

```swift
    targets: [
        .target(
            name: "Foo",
            dependencies: [
                "Publish",
                ...
                "ReadingTimePublishPlugin"
            ]
        )
    ]
```

## Usage

The plugin can then be used within any publishing pipeline like this:

```swift
import ReadingTimePublishPlugin
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
