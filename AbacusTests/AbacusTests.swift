//
//  AbacusTests.swift
//  AbacusTests
//
//  Created by Kent, Michael on 7/29/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Abacus
import XCTest

class AbacusTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUndirectedGraph() {
        let graph = UndirectedGraph<Int, Int>()
        graph.addNode(1)
        graph.addNode(2)
        graph.addEdge(0, from: 1, to: 2)
        graph.addEdge(1, from: 1, to: 2)
        graph.removeEdge(0, from: 1, to: 2)
        print("\(graph)")
    }
    
    func testUndirectedBfs() {
        let graph = UndirectedGraph<Int, Int>()
        graph.addNode(1)
        graph.addNode(2)
        graph.addNode(3)
        graph.addNode(4)
        graph.addNode(5)
        graph.addNode(6)
        
        graph.addEdge(0, from: 1, to: 2)
        graph.addEdge(0, from: 3, to: 1)
        graph.addEdge(0, from: 4, to: 2)
        graph.addEdge(0, from: 2, to: 5)
        graph.addEdge(0, from: 3, to: 6)
        print("\(graph)")
        
        print("BFS")
        graph.bfs(rootedAt: 1) { key in
            print("\(key)")
        }
    }
    
    func testUndirectedDfs() {
        let graph = UndirectedGraph<Int, Int>()
        graph.addNode(1)
        graph.addNode(2)
        graph.addNode(3)
        graph.addNode(4)
        graph.addNode(5)
        graph.addNode(6)
        
        graph.addEdge(0, from: 1, to: 2)
        graph.addEdge(0, from: 2, to: 3)
        graph.addEdge(0, from: 3, to: 4)
        graph.addEdge(0, from: 5, to: 2)
        graph.addEdge(0, from: 5, to: 6)
        print("\(graph)")
        
        print("DFS")
        graph.dfs(rootedAt: 1) { key in
            print("\(key)")
        }
    }
    
    func testDirectedGraph() {
        let graph = DirectedGraph<Int, Int>()
        graph.addNode(1)
        graph.addNode(2)
        graph.addEdge(0, from: 1, to: 2)
        graph.addEdge(1, from: 1, to: 2)
        graph.removeEdge(0, from: 1, to: 2)
        print("\(graph)")
    }
    
    func testDirectedBfs() {
        let graph = DirectedGraph<Int, Int>()
        graph.addNode(1)
        graph.addNode(2)
        graph.addNode(3)
        graph.addNode(4)
        graph.addNode(5)
        graph.addNode(6)
        
        graph.addEdge(0, from: 1, to: 2)
        graph.addEdge(0, from: 3, to: 1)
        graph.addEdge(0, from: 4, to: 2)
        graph.addEdge(0, from: 2, to: 5)
        graph.addEdge(0, from: 3, to: 6)
        print("\(graph)")
        
        print("BFS")
        graph.bfs(rootedAt: 1) { key in
            print("\(key)")
        }
    }
    
    func testDirectedDfs() {
        let graph = DirectedGraph<Int, Int>()
        graph.addNode(1)
        graph.addNode(2)
        graph.addNode(3)
        graph.addNode(4)
        graph.addNode(5)
        graph.addNode(6)
        
        graph.addEdge(0, from: 1, to: 2)
        graph.addEdge(0, from: 2, to: 3)
        graph.addEdge(0, from: 3, to: 4)
        graph.addEdge(0, from: 5, to: 2)
        graph.addEdge(0, from: 5, to: 6)
        print("\(graph)")
        
        print("DFS")
        graph.dfs(rootedAt: 1) { key in
            print("\(key)")
        }
    }
    
    func testUndirectedKruskal() {
        let graph = UndirectedGraph<Int, Int>()
        graph.addNode(0)
        graph.addNode(1)
        graph.addNode(2)
        graph.addNode(3)
        graph.addNode(4)
        graph.addNode(5)
        graph.addNode(6)
        graph.addNode(7)
        graph.addNode(8)
        
        graph.addEdge(4, from: 0, to: 1)
        graph.addEdge(8, from: 0, to: 7)
        graph.addEdge(8, from: 1, to: 2)
        graph.addEdge(11, from: 1, to: 7)
        graph.addEdge(7, from: 2, to: 3)
        graph.addEdge(4, from: 2, to: 5)
        graph.addEdge(2, from: 2, to: 8)
        graph.addEdge(9, from: 3, to: 4)
        graph.addEdge(14, from: 3, to: 5)
        graph.addEdge(10, from: 4, to: 5)
        graph.addEdge(2, from: 5, to: 6)
        graph.addEdge(1, from: 6, to: 7)
        graph.addEdge(6, from: 6, to: 8)
        graph.addEdge(7, from: 7, to: 8)
        
        let mst = graph.kruskal()
        print("Kruskal\n\(mst)")
    }
}
