//
//  Builder.swift
//  SwiftDesignPatterns
//
//  Created by naoyashiga on 2015/10/04.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import Foundation

protocol Builder {
    var redPepperLevel: Int? { get }
    var cheezeLevel: Int? { get }
    var riceSize: Int? { get }
}

class OriginalCurry {
    var redPepperLevel: Int?
    var cheezeLevel: Int?
    var riceSize: Int?
    
    typealias OriginalCurryBuilderClosure = (OriginalCurry) -> ()
    
    init(originalCurry: OriginalCurryBuilderClosure) {
        originalCurry(self)
    }
}
