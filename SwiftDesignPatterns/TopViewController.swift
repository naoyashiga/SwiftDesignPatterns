//
//  TopViewController.swift
//  SwiftDesignPatterns
//
//  Created by naoyashiga on 2015/10/03.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        singleton()
        decorator()
        factoryMethod()
        builder()
        abstractFactory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func singleton() {
        SingletonDataManager.sharedInstance.value = 1
        print(SingletonDataManager.sharedInstance.value)
    }
    
    func decorator() {
        var someCurry: Curry = SimpleCurry()
        print("Cost:\(someCurry.getCost()) ingredients:\(someCurry.getIngredients())")
        
        someCurry = ChikenCurry(decoratedCurry: someCurry)
        print("Cost:\(someCurry.getCost()) ingredients:\(someCurry.getIngredients())")
    }
    
    func factoryMethod() {
        print(CurryFactory.curryForCountry(.Thai).getIngredients())
    }
    
    func builder() {
        let originalCurry = OriginalCurry {
            $0.redPepperLevel = 10
            $0.cheezeLevel = 1
            $0.riceSize = 2
        }
        
        print("rep Pepper:\(originalCurry.redPepperLevel)")
    }
    
    func abstractFactory() {
        let order = OrderMenu.chooseMenu(.A)
        print("order price:\(order.getPrice())")
    }
}
