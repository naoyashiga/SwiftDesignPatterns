//
//  Decorator.swift
//  SwiftDesignPatterns
//
//  Created by naoyashiga on 2015/10/03.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import Foundation

protocol Curry {
    func getCost() -> Double
    func getIngredients() -> String
}

class SimpleCurry: Curry {
    func getCost() -> Double {
        return 500
    }
    
    func getIngredients() -> String {
        return "Curry"
    }
}

class CurryDecorator: Curry {
    private let decoratedCurry: Curry
    
    required init(decoratedCurry: Curry) {
        self.decoratedCurry = decoratedCurry
    }
    
    func getCost() -> Double {
        return decoratedCurry.getCost()
    }
    
    func getIngredients() -> String {
        return decoratedCurry.getIngredients()
    }
}

class ChikenCurry: CurryDecorator {
    required init(decoratedCurry: Curry) {
        super.init(decoratedCurry: decoratedCurry)
    }
    
    override func getCost() -> Double {
        return super.getCost() + 100
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + ":Chiken"
    }
}