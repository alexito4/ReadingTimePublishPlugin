import Foundation
import Publish

public protocol ReadingTimeMetadata {
    var readingTime: Double? { get set }
}

extension Plugin where Site.ItemMetadata: ReadingTimeMetadata {
    public static var readingTime: Self {
        Plugin(name: "Reading time") { context in
            context.mutateAllSections { section in
                section.mutateItems { item in
                    let words = countWords(item.content.body.html)
                    let minutes = estimateTime(for: words)
                    print("Item: \(item.title) has \(words) words and read in \(minutes) minutes")
                    item.metadata.readingTime = minutes
                }
            }
        }
    }
}

private func countWords(_ string: String) -> Int {
    // Ideally we would be able to get a plain string (even if it's the original markdown) from Plot
    let plain = string.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    let separators = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
    let words = plain.components(separatedBy: separators)
    return words.count
}

private func estimateTime(for words: Int) -> Double {
    let minutes = Double(words) / 200
    return minutes
}
