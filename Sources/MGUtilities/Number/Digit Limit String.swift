//
//  Digit Limit String.swift
//  
//
//  Created by Melvin Gundlach on 19.01.21.
//

import Foundation

public extension Double {
	func string(digitsBehindComma n: Int) -> String {
		String(format: "%.\(n)f", self) // Does round correctly
	}
}

public extension Float {
	func string(digitsBehindComma n: Int) -> String {
		String(format: "%.\(n)f", self) // Does round correctly
	}
}
