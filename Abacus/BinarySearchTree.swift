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
}