# PublishReadingTime

Reading time estimation plugin for [Publish](https://github.com/JohnSundell/Publish).

⚠️ Very much work in progress. (better calculation, configuration and a better way to store the data)

## Installation

## Usage

The plugin can then be used within any publishing pipeline like this:

```swift
import PublishReadingTime
...
try DeliciousRecipes().publish(using: [
    .installPlugin(.readingTime),
    ...
])
```

Your `WebsiteItemMetadata` needs to also conform to `ReadingTimeMetadata`.

Then you can add the information on your Theme:

```
HTML(...
.unwrap(item.metadata.readingTime, { .p("\($0) minutes") }),
...
```

# Author

Alejandro Martinez | http://alejandromp.com | [@alexito4](https://twitter.com/alexito4)
