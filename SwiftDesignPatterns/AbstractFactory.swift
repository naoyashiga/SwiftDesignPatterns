//
//  AbstractFactory.swift
//  SwiftDesignPatterns
//
//  Created by naoyashiga on 2015/10/05.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import Foundation

protocol DailyMenu {
    func getPrice() -> Int
}

class Aset: DailyMenu {
    func getPrice() -> Int {
        return 800
    }
}

class Bset: DailyMenu {
    func getPrice() -> Int {
        return 700
    }
}


enum Menu {
    case A, B
}

class OrderMenu {
    class func chooseMenu(setName: Menu) -> DailyMenu {
        switch setName {
        case .A:
            return Aset()
        case .B:
            return Bset()
        }
    }
}