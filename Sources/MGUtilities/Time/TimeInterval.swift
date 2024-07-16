//
//  TimeInterval.swift
//  
//
//  Created by Melvin Gundlach on 01.02.21.
//

import Foundation

public extension TimeInterval {
	func secondsToHoursMinutesSecondsString() -> String {
		let formatter = DateComponentsFormatter()
		formatter.allowedUnits = [.hour, .minute, .second]
		formatter.unitsStyle = .positional
		
		var s = formatter.string(from: self)!
		if s.count == 1 {
			s = "0:0\(s)"
		} else if s.count == 2 {
			s = "0:\(s)"
		}
		return s
	}
}
