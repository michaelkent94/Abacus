//
//  Traversal.swift
//  Abacus
//
//  Created by Kent, Michael on 8/16/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

extension Tree {
    
    public func preorder(forEach: (TreeNodeType.KeyType) -> ()) {
        guard let root = root else { return }
        preorder(forEach, at: root)
    }
    
    private func preorder(forEach: (TreeNodeType.KeyType) -> (), at node: TreeNodeType) {
        forEach(node.key)
        for child in node.children {
            preorder(forEach, at: child)
        }
    }
    
    public func postorder(forEach: (TreeNodeType.KeyType) -> ()) {
        guard let root = root else { return }
        postorder(forEach, at: root)
    }
    
    private func postorder(forEach: (TreeNodeType.KeyType) -> (), at node: TreeNodeType) {
        for child in node.children {
            postorder(forEach, at: child)
        }
        forEach(node.key)
    }
}

extension BinarySearchTree {
    
    public func inorder(forEach: (TreeNodeType.KeyType) -> ()) {
        guard let root = root else { return }
        inorder(forEach, at: root)
    }
    
    private func inorder(forEach: (TreeNodeType.KeyType) -> (), at node: TreeNodeType) {
        if let left = node.left {
            inorder(forEach, at: left)
        }
        forEach(node.key)
        if let right = node.right {
            inorder(forEach, at: right)
        }
    }
}