//
//  BinarySearchTree.swift
//  Abacus
//
//  Created by Kent, Michael on 8/12/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

public final class BinarySearchTreeNode<K: Comparable>: BinaryTreeNode {
    public typealias KeyType = K
    
    public var key: KeyType
    
    public var parent: BinarySearchTreeNode<KeyType>?
    public var left: BinarySearchTreeNode<KeyType>?
    public var right: BinarySearchTreeNode<KeyType>?
    
    public init(key: KeyType) {
        self.key = key
    }
}

public class BinarySearchTree<K: Comparable>: BinaryTree {
    public typealias KeyType = K
    public typealias TreeNodeType = BinarySearchTreeNode<KeyType>
    
    public var root: TreeNodeType?
    
    public var minimum: KeyType? {
        guard let root = root else { return nil }
        return findMinimumNode(at: root).key
    }
    public var maximum: KeyType? {
        guard let root = root else { return nil }
        return findMaximumNode(at: root).key
    }
    
    public init(root: TreeNodeType? = nil) {
        self.root = root
    }
    
    public func insert(key key: KeyType) {
        if let root = root {
            insert(key: key, at: root)
        } else {
            root = BinarySearchTreeNode(key: key)
        }
    }
    
    private func insert(key key: KeyType, at node: TreeNodeType) {
        if key <= node.key {
            if let left = node.left {
                insert(key: key, at: left)
            } else {
                let newNode = BinarySearchTreeNode(key: key)
                newNode.parent = node
                node.left = newNode
            }
        } else {
            if let right = node.right {
                insert(key: key, at: right)
            } else {
                let newNode = BinarySearchTreeNode(key: key)
                newNode.parent = node
                node.right = newNode
            }
        }
    }
    
    public func remove(key key: KeyType) {
        guard let root = root,
            let node = find(key: key, at: root) else { return }
        
        if node === root {
            self.root = nil
            return
        }
        
        let isLeft = node.parent?.left === node
        
        if node.children.count == 0 {
            if isLeft {
                node.parent?.left = nil
            } else {
                node.parent?.right = nil
            }
        } else if node.children.count == 1 {
            if isLeft {
                node.parent?.left = node.children.first!
            } else {
                node.parent?.right = node.children.first!
            }
        } else {
            let rightSubtree = BinarySearchTree(root: node.right!)
            let rightMinimum = rightSubtree.findMinimumNode(at: rightSubtree.root!)
            node.key = rightMinimum.key
            
            if rightMinimum.parent?.left === rightMinimum {
                rightMinimum.parent?.left = nil
            } else {
                rightMinimum.parent?.right = nil
            }
        }
    }
    
    public func contains(key key: KeyType) -> Bool {
        guard let root = root else { return false }
        return find(key: key, at: root) != nil
    }
    
    private func find(key key: KeyType, at node: TreeNodeType) -> TreeNodeType? {
        if node.key == key {
            return node
        } else if let left = node.left where key < node.key {
            return find(key: key, at: left)
        } else if let right = node.right where key > node.key {
            return find(key: key, at: right)
        } else {
            return nil
        }
    }
    
    private func findMinimumNode(at node: TreeNodeType) -> TreeNodeType {
        if let left = node.left {
            return findMinimumNode(at: left)
        } else {
            return node
        }
    }
    
    private func findMaximumNode(at node: TreeNodeType) -> TreeNodeType {
        if let right = node.right {
            return findMaximumNode(at: right)
        } else {
            return node
        }
    }
}