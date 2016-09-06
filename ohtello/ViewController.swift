//
//  ViewController.swift
//  ohtello
//
//  Created by Antoine roy on 12/06/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

var obj : Global = Global()
let arbitre : Arbitre = Arbitre()


class ViewController: UIViewController {

    //var turn : Bool = false
    let p1 : Player = Player(color: 1)
    let p2 : Player = Player(color: 2)
    
    //let imgVide : UIImageView = UIImageView(image: UIImage(named: "pionVide.png"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let backgroundImage : UIImageView = UIImageView(image: UIImage(named: "fond.png"))
        
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        p1.turn = true
        create_plateau()
        
    }

    func createPion(x : Int, y : Int) {

        let img : UIImageView = UIImageView(frame: CGRectMake(CGFloat(151 + (x * 90)),
                    CGFloat(y * 90 + 47), CGFloat(90), CGFloat(90)))
        
        if (obj.tab[(y * 8) + x] == 2) {
            img.addSubview(UIImageView(image: obj.imgBlanc))
        } else if (obj.tab[(y * 8) + x] == 1) {
            img.addSubview(UIImageView(image: obj.imgNoir))
        }
        
        obj.tabPrint.append(img)
        self.view.addSubview(obj.tabPrint[(y * 8) + x])
    }
    
    
    
    func create_plateau() {
        var j = 0
        NSLog("create plateau")
        for (var i = 0; i < 8 || j < 7; i += 1) {
            
            if (i == 8) {
                i = 0
                j += 1
            }
            
            self.createPion(i, y: j)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func putPion(x: Int, y: Int) {
        if (p1.turn == true && p2.turn == false && obj.tab[(y * 8) + x] == 0) {
            if (arbitre.arbitrage(x, y: y, color: (p1.color == 1 ? 1 : 2)) == false) {
                return ;
            }
            obj.tab[(y * 8) + x] = 1
            obj.tabPrint[(y * 8) + x].addSubview(UIImageView(image: obj.imgNoir))
            arbitre.catch_pions(x, y: y, color: 1)
            p1.turn = false
            p2.turn = true
            //arbitre.check_give(x, y: y, color: 1)
        } else if (p2.turn == true && p1.turn == false && obj.tab[(y * 8) + x] == 0) {
            if (arbitre.arbitrage(x, y: y, color: (p2.color == 1 ? 1 : 2)) == false) {
                return ;
            }
            obj.tab[(y * 8) + x] = 2
            obj.tabPrint[(y * 8) + x].addSubview(UIImageView(image: obj.imgBlanc))
            arbitre.catch_pions(x, y: y, color: 2)
            p1.turn = true
            p2.turn = false
            //arbitre.check_give(x, y: y, color: 2)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let t : UITouch = touches.first!
        let point = t.locationInView(self.view)
        
        NSLog("point :%f %f", point.x, point.y)

        if (point.x >= 151 && point.x <= 872 && point.y >= 48) {
            let p : CGPoint = CGPointMake(CGFloat((point.x - 151) / 90), CGFloat((point.y - 47) / 90))
            NSLog("%f %f", p.x, p.y)
            putPion(Int(p.x), y: Int(p.y))
        }
        
    }
    
}

