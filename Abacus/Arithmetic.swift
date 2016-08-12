//
//  Arithmetic.swift
//  Abacus
//
//  Created by Kent, Michael on 8/11/16.
//  Copyright © 2016 Kent, Michael. All rights reserved.
//

import Foundation

public protocol Arithmetic: Equatable, Comparable {
    func + (lhs: Self, rhs: Self) -> Self
    func * (lhs: Self, rhs: Self) -> Self
}

extension Int: Arithmetic {}
extension UInt: Arithmetic {}
extension Float: Arithmetic {}
extension Double: Arithmetic {}
extension CGFloat: Arithmetic {}