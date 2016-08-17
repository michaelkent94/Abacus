//
//  DirectedGraph.swift
//  Abacus
//
//  Created by Kent, Michael on 8/10/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

public class DirectedGraph<K: Hashable, W: Arithmetic>: Graph {
    public typealias KeyType = K
    public typealias WeightType = W
    
    var nodes = Set<GraphNode<KeyType>>()
    var edges = Dictionary<GraphNode<KeyType>, [GraphEdge<KeyType, WeightType>]>()
    
    public var nodeCount: Int {
        return nodes.count
    }
    
    public var edgeCount: Int {
        var count = 0
        for (_, value) in edges {
            count += value.count
        }
        return count
    }
    
    public init() { }
    
    public convenience init(graph: DirectedGraph<KeyType, WeightType>) {
        self.init()
        nodes = graph.nodes
        edges = graph.edges
    }
    
    func copy() -> AnyObject {
        let graph = DirectedGraph(graph: self)
        return graph
    }
    
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

