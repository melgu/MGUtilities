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
