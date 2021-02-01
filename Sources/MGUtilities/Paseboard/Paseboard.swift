//
//  Pasteboard.swift
//  
//
//  Created by Melvin Gundlach on 01.02.21.
//

import Foundation
import SwiftUI

#if os(macOS)

@available(OSX 10.13, *)
enum Pasteboard {
	static func copy(string: String) {
		let pb = NSPasteboard.init(name: NSPasteboard.Name.general)
		pb.declareTypes([.string], owner: nil)
		pb.setString(string, forType: .string)
	}
}

#endif
