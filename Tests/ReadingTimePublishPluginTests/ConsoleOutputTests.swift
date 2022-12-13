import Plot
import Publish
@testable import ReadingTimePublishPlugin
import XCTest

final class ConsoleOutputTests: XCTestCase {
    var capturedOutput: String?

    override func setUp() {
        super.setUp()

        capturedOutput = nil

        output = { string, _ in
            self.capturedOutput = string
        }
    }

    func testItemWithoutMetadata() {
        let item: Item<Web> = .mock

        let metadata = item.readingTime
        XCTAssertEqual(metadata.words, 0)
        XCTAssertEqual(metadata.minutes, 0)
        XCTAssertEqual(
            capturedOutput,
            #"Item "Fake" doesn't have ReadingTimeMetadata. Check that the ReadingTime plugin is installed after the creation of this item."#
        )
    }
}

private extension Item where Site == Web {
    static let mock = Item<Web>(
        path: Path("/none"),
        sectionID: Web.SectionID.test,
        metadata: Web.ItemMetadata(),
        tags: [],
        content: Content(title: "Fake", description: "None", body: .init(html: ""), date: Date(), lastModified: Date(), imagePath: nil, audio: nil, video: nil)
    )
}

private struct Web: Website {
    var url: URL

    var name: String

    var description: String

    var language: Language

    var imagePath: Path?

    enum SectionID: String, WebsiteSectionID {
        case test
    }

    struct ItemMetadata: WebsiteItemMetadata {}
}
