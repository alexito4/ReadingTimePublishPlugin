import Foundation
import Publish

public struct ReadingTimeMetadata {
    public let minutes: Double
}

extension Plugin {
    
    /// Plugin that calculates the average reading time of each `Item`.
    /// Use `Item.readingTime` to access the data.
    /// - Parameter wordsPerMinute: Average reading speed (words per minute) used to calculate the reading time.
    public static func readingTime(wordsPerMinute: Int = 200) -> Self {
        Plugin(name: "Reading time") { context in
            context.mutateAllSections { section in
                section.mutateItems { item in
                    let words = countWords(item.content.body.html)
                    let minutes = estimateTime(for: words, wordsPerMinute: wordsPerMinute)
                    print("Item: \(item.title) has \(words) words and read in \(minutes) minutes")
                    data[item] = ReadingTimeMetadata(minutes: minutes)
                }
            }
        }
    }
}

public extension Item {
    var readingTime: ReadingTimeMetadata {
        guard let metadata = data[self] else {
            fatalError()
        }
        return metadata
    }
}

private var data = [AnyHashable: ReadingTimeMetadata]()

private func countWords(_ string: String) -> Int {
    // Ideally we would be able to get a plain string (even if it's the original markdown) from Plot
    let plain = string.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    let separators = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
    let words = plain.components(separatedBy: separators)
    return words.count
}

private func estimateTime(for words: Int, wordsPerMinute: Int) -> Double {
    let minutes = Double(words) / Double(wordsPerMinute)
    return minutes
}
