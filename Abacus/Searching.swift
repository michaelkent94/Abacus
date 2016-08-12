//
//  Searching.swift
//  Abacus
//
//  Created by Kent, Michael on 8/12/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

extension DirectedGraph {
    public func bfs(rootedAt rootKey: KeyType, forEach: (KeyType) -> ()) {
        var queue = [GraphNode<KeyType>]()
        guard !nodes.isEmpty,
            let root = node(forKey: rootKey) else { return }
        
        var visited = Set<GraphNode<KeyType>>()
        
        queue.append(root)
        visited.insert(root)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            forEach(node.key)
            
            guard let edges = edges[node] else { continue }
            for adjacent in edges.map({ $0.to }) {
                if !visited.contains(adjacent) {
                    queue.append(adjacent)
                    visited.insert(adjacent)
                }
            }
        }
    }
    
    public func dfs(rootedAt rootKey: KeyType, forEach: (KeyType) -> ()) {
        var stack = [GraphNode<KeyType>]()
        guard !nodes.isEmpty,
            let root = node(forKey: rootKey) else { return }
        
        var visited = Set<GraphNode<KeyType>>()
        
        stack.append(root)
        visited.insert(root)
        while !stack.isEmpty {
            let node = stack.removeLast()
            
            forEach(node.key)
            
            guard let edges = edges[node] else { continue }
            for adjacent in edges.map({ $0.to }) {
                if !visited.contains(adjacent) {
                    stack.append(adjacent)
                    visited.insert(adjacent)
                }
            }
        }
    }
}