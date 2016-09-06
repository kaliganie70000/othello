//
//  Player.swift
//  ohtello
//
//  Created by Antoine roy on 13/06/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class Player: NSObject {
   
    var color : Int = -1
    var nbPion : Int = 0
    var turn : Bool = false
    
    override init() {
        super.init()
    }
    
    init(color : Int) {
        self.color = color
    }
    
}
