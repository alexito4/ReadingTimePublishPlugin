# PublishReadingTime

Reading time estimation plugin for [Publish](https://github.com/JohnSundell/Publish).

⚠️ Very much work in progress. (better calculation)

## Installation

## Usage

The plugin can then be used within any publishing pipeline like this:

```swift
import PublishReadingTime
...
try DeliciousRecipes().publish(using: [
    .installPlugin(.readingTime()),
    ...
])
```

Then you can add the information on your Theme:

```swift
HTML(...
.p("\(item.readingTime.minutes) minutes"),
...
```

# Author

Alejandro Martinez | http://alejandromp.com | [@alexito4](https://twitter.com/alexito4)
