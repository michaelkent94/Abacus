//
//  Graph.swift
//  Abacus
//
//  Created by Kent, Michael on 7/29/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

struct GraphNode<KeyType: Hashable>: Hashable, CustomStringConvertible {
    let key: KeyType
    
    var hashValue: Int {
        return key.hashValue
    }
    
    var description: String {
        if let key = key as? CustomStringConvertible {
            return key.description
        } else {
            return "\(hashValue)"
        }
    }
}

func == <K: Hashable>(lhs: GraphNode<K>, rhs: GraphNode<K>) -> Bool {
    return lhs.key == rhs.key
}

struct GraphEdge<KeyType: Hashable, WeightType: Comparable>: CustomStringConvertible {
    let from: GraphNode<KeyType>
    let to: GraphNode<KeyType>
    let weight: WeightType
    
    var description: String {
        if let weight = weight as? CustomStringConvertible {
            
            return "\(from) - \(weight) -> \(to)"
        } else {
            return "\(from) --> \(to)"
        }
    }
}

public protocol Graph {
    associatedtype KeyType: Hashable
    associatedtype WeightType: Comparable
    
    mutating func addNode(key: KeyType)
    mutating func removeNode(key: KeyType)
    mutating func addEdge(weight: WeightType, from: KeyType, to: KeyType)
    mutating func removeEdge(weight: WeightType, from: KeyType, to: KeyType)
    
    func bfs(rootedAt rootKey: KeyType, forEach: (KeyType)->())
    func dfs(rootedAt rootKey: KeyType, forEach: (KeyType)->())
}