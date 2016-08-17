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
        
        var keys = [Int]()
        graph.bfs(rootedAt: 1) { key in
            keys.append(key)
        }
        XCTAssert(keys == [1, 2, 3, 4, 5, 6])
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
        
        var keys = [Int]()
        graph.dfs(rootedAt: 1) { key in
            keys.append(key)
        }
        XCTAssert(keys == [1, 2, 5, 6, 3, 4])
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
        
        var keys = [Int]()
        graph.bfs(rootedAt: 1) { key in
            keys.append(key)
        }
        XCTAssert(keys == [1, 2, 5])
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
        
        var keys = [Int]()
        graph.dfs(rootedAt: 1) { key in
            keys.append(key)
        }
        XCTAssert(keys == [1, 2, 3, 4])
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
        var keys = [Int]()
        mst.bfs(rootedAt: 1) { key in
            keys.append(key)
        }
        XCTAssert(keys == [1, 0, 2, 8, 5, 3, 6, 4, 7])
        XCTAssert(mst.edgeCount == 8)
    }
    
    func testBSTPreorder() {
        let bst = BinarySearchTree<Int>()
        bst.insert(key: 4)
        bst.insert(key: 2)
        bst.insert(key: 1)
        bst.insert(key: 3)
        
        var keys = [Int]()
        bst.preorder { key in
            keys.append(key)
        }
        XCTAssert(keys == [4, 2, 1, 3])
    }
    
    func testBSTPostorder() {
        let bst = BinarySearchTree<Int>()
        bst.insert(key: 4)
        bst.insert(key: 2)
        bst.insert(key: 1)
        bst.insert(key: 3)
        
        var keys = [Int]()
        bst.postorder { key in
            keys.append(key)
        }
        XCTAssert(keys == [1, 3, 2, 4])
    }
    
    func testBSTInorder() {
        let bst = BinarySearchTree<Int>()
        bst.insert(key: 4)
        bst.insert(key: 2)
        bst.insert(key: 1)
        bst.insert(key: 3)
        
        var keys = [Int]()
        bst.inorder { key in
            keys.append(key)
        }
        XCTAssert(keys == [1, 2, 3, 4])
    }
    
    func testBSTRemove() {
        let bst = BinarySearchTree<Int>()
        bst.insert(key: 4)
        bst.insert(key: 2)
        bst.insert(key: 1)
        bst.insert(key: 3)
        
        bst.remove(key: 2)
        
        var keys = [Int]()
        bst.inorder { key in
            keys.append(key)
        }
        XCTAssert(keys == [1, 3, 4])
    }
    
    func testBSTContains() {
        let bst = BinarySearchTree<Int>()
        bst.insert(key: 4)
        bst.insert(key: 2)
        bst.insert(key: 1)
        bst.insert(key: 3)
        
        XCTAssert(bst.contains(key: 2))
        XCTAssert(bst.contains(key: 3))
        XCTAssert(!bst.contains(key: 5))
    }
    
    func testBSTMinMax() {
        let bst = BinarySearchTree<Int>()
        bst.insert(key: 4)
        bst.insert(key: 2)
        bst.insert(key: 1)
        bst.insert(key: 3)
        
        XCTAssert(bst.minimum == 1)
        XCTAssert(bst.maximum == 4)
    }
}
