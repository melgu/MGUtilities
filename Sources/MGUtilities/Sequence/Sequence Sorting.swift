//
//  Sequence Sorting.swift
//  
//
//  Created by Melvin Gundlach on 12.01.21.
//

import Foundation

// MARK: Sorting by KeyPath

public extension Sequence {
	// MARK: sort
	
	// MARK: Non-optional
	
	mutating func sort<Value: Comparable, Value2: Comparable>(
		by keyPath: KeyPath<Self.Element, Value>,
		using valuesAreInIncreasingOrder: (Value, Value) throws -> Bool,
		and keyPath2: KeyPath<Self.Element, Value2>,
		using valuesAreInIncreasingOrder2: (Value2, Value2) throws -> Bool
	) rethrows {
		self = try sorted(
			by: keyPath,
			using: valuesAreInIncreasingOrder,
			and: keyPath2,
			using: valuesAreInIncreasingOrder2
		) as! Self
	}
	
	mutating func sort<Value>(
		by keyPath: KeyPath<Self.Element, Value>,
		using valuesAreInIncreasingOrder: (Value, Value) throws -> Bool
	) rethrows {
		self = try sorted(by: keyPath, using: valuesAreInIncreasingOrder) as! Self
	}
	
	mutating func sort<Value: Comparable>(
		by keyPath: KeyPath<Self.Element, Value>
	) {
		self = sorted(by: keyPath, using: <) as! Self
	}
	
	// MARK: Optional
	
	mutating func sort<Value: Comparable, Value2: Comparable>(
		by keyPath: KeyPath<Self.Element, Value?>,
		using valuesAreInIncreasingOrder: (Value?, Value?) throws -> Bool,
		and keyPath2: KeyPath<Self.Element, Value2?>,
		using valuesAreInIncreasingOrder2: (Value2?, Value2?) throws -> Bool
	) rethrows {
		self = try sorted(
			by: keyPath,
			using: valuesAreInIncreasingOrder,
			and: keyPath2,
			using: valuesAreInIncreasingOrder2
		) as! Self
	}
	
	mutating func sort<Value>(
		by keyPath: KeyPath<Self.Element, Value?>,
		using valuesAreInIncreasingOrder: (Value?, Value?) throws -> Bool
	) rethrows {
		self = try sorted(by: keyPath, using: valuesAreInIncreasingOrder) as! Self
	}
	
	mutating func sort<Value: Comparable>(
		by keyPath: KeyPath<Self.Element, Value?>
	) {
		self = sorted(by: keyPath, using: <) as! Self
	}
	
	
	// MARK: sorted
	
	// MARK: Non-optional
	
	mutating func sorted<Value: Comparable, Value2: Comparable>(
		by keyPath: KeyPath<Self.Element, Value>,
		using valuesAreInIncreasingOrder: (Value, Value) throws -> Bool,
		and keyPath2: KeyPath<Self.Element, Value2>,
		using valuesAreInIncreasingOrder2: (Value2, Value2) throws -> Bool
	) rethrows -> [Self.Element] {
		return try sorted {
			if $0[keyPath: keyPath] == $1[keyPath: keyPath] {
				return try valuesAreInIncreasingOrder2($0[keyPath: keyPath2], $1[keyPath: keyPath2])
			} else {
				return try valuesAreInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
			}
		}
	}
	
	func sorted<Value>(
		by keyPath: KeyPath<Self.Element, Value>,
		using valuesAreInIncreasingOrder: (Value, Value) throws -> Bool
	) rethrows -> [Self.Element]
	{
		return try sorted {
			try valuesAreInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
		}
	}
	
	func sorted<Value: Comparable>(
		by keyPath: KeyPath<Self.Element, Value>)
	-> [Self.Element]
	{
		return sorted(by: keyPath, using: <)
	}
	
	// MARK: Optional
	
	mutating func sorted<Value: Comparable, Value2: Comparable>(
		by keyPath: KeyPath<Self.Element, Value?>,
		using valuesAreInIncreasingOrder: (Value?, Value?) throws -> Bool,
		and keyPath2: KeyPath<Self.Element, Value2?>,
		using valuesAreInIncreasingOrder2: (Value2?, Value2?) throws -> Bool
	) rethrows -> [Self.Element] {
		return try sorted {
			if $0[keyPath: keyPath] == $1[keyPath: keyPath] {
				return try valuesAreInIncreasingOrder2($0[keyPath: keyPath2], $1[keyPath: keyPath2])
			} else {
				return try valuesAreInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
			}
		}
	}
	
	func sorted<Value>(
		by keyPath: KeyPath<Self.Element, Value?>,
		using valuesAreInIncreasingOrder: (Value?, Value?) throws -> Bool
	) rethrows -> [Self.Element]
	{
		return try sorted {
			try valuesAreInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
		}
	}
	
	func sorted<Value: Comparable>(
		by keyPath: KeyPath<Self.Element, Value?>)
	-> [Self.Element]
	{
		return sorted(by: keyPath, using: <)
	}
}
