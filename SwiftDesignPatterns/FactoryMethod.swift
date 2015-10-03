//
//  FactoryMethod.swift
//  SwiftDesignPatterns
//
//  Created by naoyashiga on 2015/10/03.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import Foundation

enum Country {
    case Japan, India, Thai
}

class CurryFactory {
    class func curryForCountry(country: Country) -> Curry {
        let simpleCurry = SimpleCurry()
        
        switch country {
        case .Japan:
            return RiceCurry(decoratedCurry: simpleCurry)
        case .India:
            return ChikenCurry(decoratedCurry: simpleCurry)
        case .Thai:
            return GreenCurry(decoratedCurry: simpleCurry)
        }
    }
}