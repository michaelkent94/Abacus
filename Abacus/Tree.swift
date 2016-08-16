//
//  Tree.swift
//  Abacus
//
//  Created by Kent, Michael on 8/12/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

public protocol TreeNode {
    associatedtype KeyType
    var key: KeyType { get }
    var parent: Self? { get }
    var children: [Self] { get }
}

public protocol Tree {
    associatedtype KeyType
    associatedtype TreeNodeType: TreeNode
    
    var root: TreeNodeType? { get }
    
    func preorder(forEach: (TreeNodeType.KeyType) -> ())
    func postorder(forEach: (TreeNodeType.KeyType) -> ())
}