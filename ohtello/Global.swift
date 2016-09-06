//
//  Global.swift
//  ohtello
//
//  Created by Antoine roy on 14/06/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class Global: NSObject {
   
    var tab : [Int] = [
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2, 1, 0, 0, 0,
        0, 0, 0, 1, 2, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
    ]
    
    var tabPrint : [UIImageView] = []
    
    let imgNoir : UIImage = UIImage(named: "pionNoir.png")!
    let imgBlanc : UIImage = UIImage(named: "pionBlanc.png")!
    
    
    override init() {
        super.init()
    }
    
}
