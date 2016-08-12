//
//  MinimumSpanningTree.swift
//  Abacus
//
//  Created by Kent, Michael on 8/12/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

extension DirectedGraph {
    public func kruskal() -> DirectedGraph<KeyType, WeightType> {
        let mst = self.copy() as! DirectedGraph
        var edgeList = [GraphEdge<KeyType, WeightType>]()
        for (node, edges) in self.edges {
            edgeList.appendContentsOf(edges)
            mst.edges[node]?.removeAll()
        }
        
        // Prioritize the edges
        edgeList.sortInPlace { (lhs, rhs) -> Bool in
            return lhs.weight < rhs.weight
        }
        
        // Keep track of the components
        let components = UnionFind(items: Array(nodes))
        
        // Take the edges by minimum weight
        for edge in edgeList {
            // If everything is connected, don't bother continuing
            if components.count == 1 { break }
            
            guard let fromComp = components.find(edge.from),
                let toComp = components.find(edge.to) else { continue }
            
            if fromComp != toComp {
                mst.addEdge(edge.weight, from: edge.from.key, to: edge.to.key)
                components.union(fromComp, toComp)
            }
        }
        
        return mst
    }
}