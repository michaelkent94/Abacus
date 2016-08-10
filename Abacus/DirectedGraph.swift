//
//  DirectedGraph.swift
//  Abacus
//
//  Created by Kent, Michael on 8/10/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

public class DirectedGraph<K: Hashable, W: Comparable>: Graph {
    public typealias KeyType = K
    public typealias WeightType = W
    
    var nodes = Set<GraphNode<KeyType>>()
    var edges = Dictionary<GraphNode<KeyType>, [GraphEdge<KeyType, WeightType>]>()
    
    public init() { }
    
    // MARK: - Modification
    
    public func addNode(key: KeyType) {
        let node = GraphNode(key: key)
        nodes.insert(node)
        edges[node] = [GraphEdge<KeyType, WeightType>]()
    }
    
    public func removeNode(key: KeyType) {
        guard let node = node(forKey: key) else { return }
        edges.removeValueForKey(node)
        nodes.remove(node)
    }
    
    public func addEdge(weight: WeightType, from: KeyType, to: KeyType) {
        guard let fromNode = node(forKey: from),
            let toNode = node(forKey: to) else { return }
        
        let edge = GraphEdge(from: fromNode, to: toNode, weight: weight)
        edges[fromNode]?.append(edge)
    }
    
    public func removeEdge(weight: WeightType, from: KeyType, to: KeyType) {
        guard let fromNode = node(forKey: from),
            let edgeIndex = edges[fromNode]?.indexOf({ edge -> Bool in
                return edge.weight == weight && edge.from.key == from && edge.to.key == to
            }) else { return }
        
        edges[fromNode]?.removeAtIndex(edgeIndex)
    }
    
    // MARK: - Searching
    
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
    
    // MARK: - Helpers
    
    func node(forKey key: KeyType) -> GraphNode<KeyType>? {
        for node in nodes {
            if node.key == key {
                return node
            }
        }
        return nil
    }
}

extension DirectedGraph: CustomStringConvertible {
    public var description: String {
        return "Nodes: \(nodes)\nEdges:\(edges)"
    }
}