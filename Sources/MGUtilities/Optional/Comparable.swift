//
//  Comparable.swift
//  
//
//  Created by Melvin Gundlach on 21.01.21.
//

import Foundation

extension Optional: Comparable where Wrapped: Comparable {
	public static func < (lhs: Optional<Wrapped>, rhs: Optional<Wrapped>) -> Bool {
		guard let lhs = lhs else { return false }
		guard let rhs = rhs else { return true }
		return lhs < rhs
	}
}
