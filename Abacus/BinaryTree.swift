//
//  BinaryTree.swift
//  Abacus
//
//  Created by Kent, Michael on 8/12/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

public protocol BinaryTreeNode: TreeNode {
    var left: Self? { get }
    var right: Self? { get }
}

extension BinaryTreeNode {
    public var children: [Self] {
        if let left = left, let right = right {
            return [left, right]
        } else if let left = left {
            return [left]
        } else if let right = right {
            return [right]
        } else {
            return []
        }
    }
}

public protocol BinaryTree: Tree {
    
}