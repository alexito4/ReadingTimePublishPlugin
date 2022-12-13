/**
 * CommandLine extension taken from Publish itself.
 * https://github.com/JohnSundell/Publish/blob/master/Sources/Publish/Internal/CommandLine%2BOutput.swift
 */

import Foundation

var output: (String, OutputKind) -> Void = { string, kind in
    var string = string + "\n"

    if let emoji = kind.emoji {
        string = "\(emoji) \(string)"
    }

    fputs(string, kind.target)
}

enum OutputKind {
    case info
    case warning
    case error
    case success
}

private extension OutputKind {
    var emoji: Character? {
        switch self {
        case .info:
            return nil
        case .warning:
            return "⚠️"
        case .error:
            return "❌"
        case .success:
            return "✅"
        }
    }

    var target: UnsafeMutablePointer<FILE> {
        switch self {
        case .info, .warning, .success:
            return stdout
        case .error:
            return stdout
        }
    }
}
