//
//  UnionFind.swift
//  Abacus
//
//  Created by Kent, Michael on 8/11/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

public class UnionFind<K: Hashable> {
    
    private var sets = Set<Set<K>>()
    
    public var count: Int {
        return sets.count
    }
    
    public init(items: [K]) {
        for item in items {
            sets.insert(Set(arrayLiteral: item))
        }
    }
    
    public func find(item: K) -> Set<K>? {
        for set in sets {
            if set.contains(item) {
                return set
            }
        }
        return nil
    }
    
    public func union(a: Set<K>, _ b: Set<K>) {
        if a == b { return }
        sets.remove(a)
        sets.remove(b)
        sets.insert(a.union(b))
    }
}