//
//  UndirectedGraph.swift
//  Abacus
//
//  Created by Kent, Michael on 7/29/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

public final class UndirectedGraph<K: Hashable, W: Comparable>: DirectedGraph<K, W> {
    
    public override init() { }
    
    // MARK: - Modification
    
    public override func addEdge(weight: WeightType, from: KeyType, to: KeyType) {
        super.addEdge(weight, from: from, to: to)
        
        guard let fromNode = node(forKey: from),
            let toNode = node(forKey: to) else { return }
        
        let backwardEdge = GraphEdge(from: toNode, to: fromNode, weight: weight)
        edges[toNode]?.append(backwardEdge)
    }
    
    public override func removeEdge(weight: WeightType, from: KeyType, to: KeyType) {
        super.removeEdge(weight, from: from, to: to)
        
        guard let toNode = node(forKey: to),
            edgeIndex = edges[toNode]?.indexOf({ edge -> Bool in
                return edge.weight == weight && edge.from.key == to && edge.to.key == from
            }) else { return }
        
        edges[toNode]?.removeAtIndex(edgeIndex)
    }
}