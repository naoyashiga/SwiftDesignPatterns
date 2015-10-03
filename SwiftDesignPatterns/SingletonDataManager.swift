//
//  SingletonDataManager.swift
//  SwiftDesignPatterns
//
//  Created by naoyashiga on 2015/10/03.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import Foundation

class SingletonDataManager {
    var value = 0
    static let sharedInstance = SingletonDataManager()
}