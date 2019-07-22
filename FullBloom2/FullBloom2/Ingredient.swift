//
//  Ingredient.swift
//  FullBloom2
//
//  Created by Archisha Majee on 7/20/19.
//  Copyright © 2019 Archisha Majee. All rights reserved.
//

import Foundation


struct Ingredient {
    var unit:String
    var name:String
    var amount:Int
    
    init(unit:String, name:String, amount:Int) {
        self.unit = unit
        self.name = name
        self.amount = amount
    }
}
