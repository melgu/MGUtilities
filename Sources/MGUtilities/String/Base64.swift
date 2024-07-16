//
//  Base64.swift
//
//
//  Created by Melvin Gundlach on 16.07.23.
//

import Foundation

public extension String {
	func base64Encoded(options: Data.Base64EncodingOptions = []) -> String {
		Data(self.utf8).base64EncodedString(options: options)
	}
}

public extension String {
	init?(base64Encoded base64String: String, options: Data.Base64DecodingOptions) {
		guard let data = Data(base64Encoded: base64String, options: options) else { return nil }
		self.init(data: data, encoding: .utf8)
	}
}
