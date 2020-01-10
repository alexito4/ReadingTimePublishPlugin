import XCTest
@testable import ReadingTimePublishPlugin

final class PublishReadingTimeTests: XCTestCase {
    
    func testShortText() {
        Assert(
            "one",
            words: 1,
            minutes: 0.005
        )
        Assert(
            "this has 4 words",
            words: 4,
            minutes: 0.02
        )
    }
    
    func testLongText() {
        Assert(
           loremIpsum,
           words: 1000,
           minutes: 5
       )
    }
    
    func testEmptyText() {
        Assert(
            "",
            words: 0,
            minutes: 0
        )
        Assert(
            " ",
            words: 0,
            minutes: 0
        )
        Assert(
            """
            
            
            """,
            words: 0,
            minutes: 0
        )
        Assert(
            " . ",
            words: 0,
            minutes: 0
        )
    }
    
    func testMultipleSpaces() {
        Assert(
            "     leading spaces",
            words: 2,
            minutes: 0.01
        )
        Assert(
            "trailing spaces     ",
            words: 2,
            minutes: 0.01
        )
        Assert(
            "multiple       spaces",
            words: 2,
            minutes: 0.01
        )
    }
    
    func testPunctuation() {
        Assert(
            "this has 4.words",
            words: 4,
            minutes: 0.02
        )
        _Assert(
            "this has 4.0 words",
            words: 4,
            minutes: 0.02
        )
        _Assert(
            "this hasn't 5 words",
            words: 4,
            minutes: 0.02
        )
    }
    
    func testHTMLTags() {
        Assert(
            "<p>html with <b>four</b> words</p>",
            words: 4,
            minutes: 0.02
        )
        Assert(
            "<h1>Header should</h1><p>not merge words</p>",
            words: 5,
            minutes: 0.025
        )
    }

    static var allTests = [
        ("testShortText", testShortText),
    ]
}

func Assert(
    _ string: String,
    words: Int,
    wordsPerMinute: Int = 200,
    minutes: Double,
    file: StaticString = #file,
    line: UInt = #line
) {
    XCTAssertEqual(
        estimateTime(for: string, wordsPerMinute: wordsPerMinute),
        ReadingTimeMetadata(
            minutes: minutes,
            words: words
        ),
        file: file,
        line: line
    )
}

func _Assert(
    _ string: String,
    words: Int,
    wordsPerMinute: Int = 200,
    minutes: Double,
    file: StaticString = #file,
    line: UInt = #line
) {}

let loremIpsum = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget pretium felis. Etiam a sem justo. Suspendisse potenti. Praesent vestibulum pellentesque pharetra. Nulla volutpat metus nisl, a lacinia tellus interdum eget. Vestibulum feugiat ut elit vitae ultricies. Integer non quam felis.

Etiam aliquam a enim vitae molestie. Praesent imperdiet semper odio vel imperdiet. Fusce sollicitudin purus euismod, euismod dolor quis, ornare lorem. Suspendisse id rhoncus felis. Vivamus tempor, erat in fringilla sollicitudin, lacus leo egestas orci, id vestibulum tellus libero eu orci. Ut faucibus sagittis ex, vitae gravida dolor convallis vitae. Suspendisse condimentum diam vel erat posuere rutrum.

Fusce convallis massa vehicula risus scelerisque eleifend. Donec vel lacus sed risus luctus efficitur sit amet quis mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec efficitur mi tellus, ac pretium justo ultrices at. Nunc a nibh turpis. Integer at lorem elementum, porta lacus in, porttitor metus. Vivamus at ex a ante lacinia vulputate non et justo. Phasellus tempus erat fringilla consequat bibendum. Nunc mollis turpis eget neque lobortis, vel porta turpis fringilla. Vivamus volutpat elementum nibh. Aliquam eget eros sodales, bibendum ante ac, egestas arcu. Suspendisse potenti. Suspendisse potenti. Fusce fermentum ante et lacus egestas hendrerit. Quisque convallis erat lacus, a euismod ante sollicitudin sed.

Fusce fermentum diam quis lacus porta, in vulputate nisl mollis. Nulla aliquet leo sed sem volutpat fringilla. Curabitur faucibus est nisi, vitae commodo nisi egestas vel. Duis id velit vel arcu pretium vehicula. Nullam sagittis hendrerit lectus pharetra lobortis. In lobortis eu tellus sit amet sollicitudin. Ut non euismod nulla. Maecenas metus orci, hendrerit id ex sit amet, condimentum feugiat eros. Fusce sit amet commodo urna. Ut purus est, tempus nec ullamcorper ut, bibendum at erat. Proin finibus rhoncus ligula at fringilla. Praesent sodales mauris leo, non gravida arcu suscipit in. Donec blandit elit facilisis molestie commodo. Integer velit neque, egestas quis lorem eu, feugiat ullamcorper turpis. In id ullamcorper elit. Curabitur tincidunt turpis velit, at varius turpis iaculis eget.

Duis dictum nunc et velit eleifend, dignissim porta ipsum placerat. In eu sagittis dui. Suspendisse tincidunt dapibus ante porta hendrerit. Proin gravida enim sit amet libero hendrerit bibendum. Mauris a dolor nisi. Sed vehicula ullamcorper nibh, vitae sagittis neque suscipit sed. Sed vel risus vulputate, eleifend nisi vel, feugiat mauris. Suspendisse vel enim non erat dignissim malesuada nec quis ex. Aliquam sem tellus, molestie non sem sit amet, lobortis dictum ex. Etiam dignissim massa mollis urna imperdiet lobortis. Nam in sem pellentesque, vehicula sapien sit amet, cursus massa. Vivamus vitae magna congue, efficitur augue id, pulvinar tortor. Integer dolor massa, tristique in orci nec, tempor faucibus ligula. Nulla posuere purus eget volutpat ultrices.

Sed a est rhoncus dui bibendum eleifend. Donec hendrerit quam quam, eu lobortis ipsum mattis et. In nec lectus dictum, commodo lorem et, interdum risus. Mauris sollicitudin ante ac feugiat volutpat. Phasellus ultricies nunc ac gravida elementum. Phasellus a blandit neque. Vivamus tempus sem non lectus commodo, at fermentum diam mollis. Aliquam erat volutpat. Nam suscipit dictum quam, sit amet porttitor libero posuere sit amet. Fusce consequat eget sapien venenatis rhoncus. Nunc auctor tellus eu enim consequat auctor. Fusce id faucibus risus. Ut suscipit felis in convallis efficitur.

Vivamus faucibus arcu ac lectus elementum rutrum sit amet porta purus. Vestibulum a lectus imperdiet, bibendum dolor vitae, porttitor velit. Vivamus nec sem in turpis dictum rhoncus sit amet id dolor. Quisque sit amet tristique orci. Vestibulum orci nisi, ullamcorper a sollicitudin vitae, fermentum sed lorem. Etiam id purus a odio posuere eleifend. Cras eleifend augue ut metus vulputate faucibus. Nullam semper, ante et convallis pharetra, est nulla lobortis erat, vitae tempor mauris lectus at enim. Nulla ut ex suscipit, auctor tortor nec, tincidunt urna. Duis suscipit quam quis urna bibendum, in maximus arcu sollicitudin.

Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras rhoncus mauris in elit congue placerat. Vivamus fermentum nulla a imperdiet imperdiet. Cras scelerisque elit purus, ut luctus leo sollicitudin id. Nulla velit lacus, tincidunt sed turpis sit amet, blandit volutpat mi. Phasellus iaculis est quis enim viverra, a aliquam massa egestas. Aliquam vitae magna lobortis, ornare ex commodo, dictum nibh. Ut pellentesque dolor ut tellus aliquet, id semper ex mattis. Sed malesuada ante vitae porttitor suscipit. Nullam maximus, ipsum quis tempus tincidunt, ante metus dictum risus, sed finibus mi risus eu erat. Maecenas eros enim, aliquet at consequat at, tincidunt et turpis.

Sed et ex vel lorem fermentum eleifend in eget tortor. Vivamus ante orci, scelerisque nec mauris eu, pretium imperdiet turpis. Aenean ac nisl tincidunt, aliquet ex at, faucibus urna. Etiam nec fringilla mi. In porttitor lectus suscipit sem posuere, id sodales erat tristique. Vivamus interdum viverra ex, sit amet fringilla magna eleifend eget. Vivamus ullamcorper efficitur mauris, non ornare leo malesuada quis. Cras non augue sed felis dictum maximus. Ut nec condimentum nunc. Integer tempus sagittis nunc, a ultricies sem venenatis quis. Maecenas euismod nibh et tellus condimentum, sit amet placerat ipsum aliquet. Curabitur ac velit non lacus viverra bibendum. Cras sed mattis velit. Phasellus nec justo ante. Donec ultricies ipsum sollicitudin nunc malesuada efficitur.

Etiam pharetra odio id ex dapibus, et rhoncus magna ornare. Ut ac ligula auctor, dignissim nibh quis, pharetra erat. Aenean id mauris eros. Sed dapibus sapien nec velit sodales gravida. Curabitur ultricies aliquam lorem, placerat auctor ipsum ullamcorper sit amet. Nunc eget gravida risus, et imperdiet nisi. Duis id ex et ante porta facilisis porttitor elementum dolor. Sed massa arcu, porttitor vel pellentesque vitae, fringilla eu magna. In hac habitasse platea dictumst. Quisque ac leo augue. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec vitae scelerisque ligula, ut mollis purus. Vivamus in metus nec libero semper porttitor.

Sed pulvinar suscipit lorem a euismod. Cras ultrices iaculis ligula, eu posuere augue tempus quis. Mauris euismod accumsan tempus. Fusce aliquam, est nec dignissim sagittis, ex augue ultrices nisl, in eleifend augue mi et ante. Phasellus vitae leo nec sem sodales ultricies id ut ligula. Curabitur commodo sit amet enim in sollicitudin.
"""
