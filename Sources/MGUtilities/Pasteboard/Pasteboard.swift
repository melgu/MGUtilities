//
//  Pasteboard.swift
//  
//
//  Created by Melvin Gundlach on 01.02.21.
//

import Foundation
import SwiftUI

enum Pasteboard {
	static func copy(string: String) {
		#if canImport(UIKit)
		UIPasteboard.general.string = string
		#else
		NSPasteboard.general.setString(string, forType: .string)
		#endif
	}
}
