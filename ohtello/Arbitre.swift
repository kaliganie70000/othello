//
//  Arbitre.swift
//  ohtello
//
//  Created by Antoine roy on 14/06/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class Arbitre: NSObject {
   
    var g : Bool = false
    var d : Bool = false
    var h : Bool = false
    var b : Bool = false
    
    var hg : Bool = false
    var hd : Bool = false
    var bg : Bool = false
    var bd : Bool = false
    
    override init() {
        super.init()
    }
    
    func arbitrage(x: Int, y: Int, color: Int) -> Bool {
        
        let pos : Int = (y * 8) + x
        g = false
        d = false
        h = false
        b = false
        
        hg = false
        hd = false
        bg = false
        bd = false
        
        let colorInv : Int = (color == 1 ? 2 : 1)
        
        var ret : Bool = false
        
        if (x - 1 >= 0 && obj.tab[pos - 1] == colorInv) { //gauche
            ret = true
        } else if (y - 1 >= 0 && obj.tab[pos - 8] == colorInv) { //haut
            ret = true
        } else if (y - 1 >= 0 && x - 1 >= 0 && obj.tab[pos - 9] == colorInv) { // haut-gauche
            ret = true
        } else if (y - 1 >= 0 && x + 1 <= 7 && obj.tab[pos - 7] == colorInv) { // haut-droite
            ret = true
        } else if (x + 1 <= 7 && obj.tab[pos + 1] == colorInv) { //droite
            ret = true
        } else if (y + 1 <= 7 && obj.tab[pos + 8] == colorInv) { // bas
            ret = true
        } else if (x + 1 <= 7 && y + 1 <= 7 && obj.tab[pos + 9] == colorInv) { //bas droite
            ret = true
        } else if (y + 1 <= 7 && x - 1 >= 0 && obj.tab[pos + 7] == colorInv) { // bas gauche
            ret = true
        }
        
        NSLog("ret : %@", (ret == true ? "true" : "false"))
        
        if (ret == true) {
            ret = check_give(x, y: y, color: color)
        }
        
        return ret
    }
    
    func check_give(x: Int, y: Int, color: Int) -> Bool {
        var posX : Int = x
        var posY : Int = y
        
        var pos : Int
        var good : Bool = true
        var see_color : Bool = false
        var can : Bool = false
        
        let colorInv : Int = (color == 1 ? 2 : 1)
        
        NSLog("color : %d et colorInv : %d", color, colorInv)
        
        
        if (posX - 1 >= 0 && obj.tab[(posY * 8) + posX - 1] == color) {
            can = false
        }
        
        NSLog("can pour gauche : %@", can)
        
        while (can == true && posX > 0 && g == false) { // gauche
            posX -= 1
            pos = (posY * 8) + posX
            if (obj.tab[pos] == 0) {
                good = false
            }
            NSLog("avant -> see : %@ et good : %@ et d : %@", see_color, good, g)
            if (see_color == false && obj.tab[pos] == colorInv && good) {
                see_color = true
            } else if (see_color && obj.tab[pos] == color && good == true) {
                g = true
            }
            NSLog("apres -> see : %@ et good : %@ et d : %@", see_color, good, g)
        }
        see_color = false
        good = true
        posX = x
        can = true
        
        
        if (posX + 1 <= 7 && obj.tab[(posY * 8) + posX + 1] == color) {
            can = false
        }
        
        while (can == true && posX < 7 && d == false) { // droite
            posX += 1
            pos = (posY * 8) + posX
            if (obj.tab[pos] == 0) {
                good = false
            }
            //NSLog("avant -> see : %@ et good : %@ et d : %@", see_color, good, d)
            if (see_color == false && obj.tab[pos] == colorInv && good) {
                see_color = true
            } else if (see_color && obj.tab[pos] == color && good) {
                d = true
            } else {
                good = false
            }
            //NSLog("apres -> see : %@ et good : %@ et d : %@", see_color, good, d)
        }
        see_color = false
        good = true
        posX = x
        can = true
        
        
        if (posY - 1 >= 0 && obj.tab[((posY - 1) * 8) + posX] == color) {
            can = false
        }
        
        while (can == true && posY > 0 && h == false) { // haut
            posY -= 1
            pos = (posY * 8) + posX
            if (obj.tab[pos] == 0) {
                good = false
            }
            NSLog("avant -> see : %@ et good : %@ et h : %@", see_color, good, h)
            if (see_color == false && obj.tab[pos] == colorInv && good) {
                see_color = true
            } else if (see_color && obj.tab[pos] == color && good) {
                h = true
            }
            NSLog("apres -> see : %@ et good : %@ et h : %@", see_color, good, h)
        }
        see_color = false
        good = true
        posY = y
        can = true
        
        
        if (posY + 1 <= 7 && obj.tab[((posY + 1) * 8) + posX] == color) {
            can = false
        }
        
        while (can == true && posY < 7 && b == false) { // bas
            posY += 1
            pos = (posY * 8) + posX
            if (obj.tab[pos] == 0) {
                good = false
            }
            NSLog("avant -> see : %@ et good : %@ et b : %@", see_color, good, b)
            if (see_color == false && obj.tab[pos] == colorInv && good) {
                see_color = true
            } else if (see_color && obj.tab[pos] == color && good) {
                b = true
            }
            NSLog("apres -> see : %@ et good : %@ et b : %@", see_color, good, b)
        }
        see_color = false
        good = true
        posY = y
        can = true
        
    
        while (can == true && (posY > 0 && posX > 0) && hg == false) { // haut gauche
            posY -= 1
            posX -= 1
            pos = (posY * 8) + posX
            if (obj.tab[pos] == 0) {
                good = false
            }
            if (see_color == false && obj.tab[pos] == colorInv && good) {
                see_color = true
            } else if (see_color && obj.tab[pos] == color && good) {
                hg = true
            }
        }
        see_color = false
        good = true
        posY = y
        posX = x
        can = true
        
        
        while (can == true && (posY < 7 && posX < 7) && bd == false) { // bas droite
            posY += 1
            posX += 1
            pos = (posY * 8) + posX
            if (obj.tab[pos] == 0) {
                good = false
            }
            if (see_color == false && obj.tab[pos] == colorInv && good) {
                see_color = true
            } else if (see_color && obj.tab[pos] == color && good) {
                bd = true
            }
        }
        see_color = false
        good = true
        posY = y
        posX = x
        can = true
        
        
        while (can == true && (posY > 0 && posX < 7) && hd == false) { // haut droite
            posY -= 1
            posX += 1
            pos = (posY * 8) + posX
            if (obj.tab[pos] == 0) {
                good = false
            }
            if (see_color == false && obj.tab[pos] == colorInv && good) {
                see_color = true
            } else if (see_color && obj.tab[pos] == color && good) {
                hd = true
            }
        }
        see_color = false
        good = true
        posY = y
        posX = x
        can = true
        
        
        while (can == true && (posY < 7 && posX > 0) && bg == false) { // bas gauche
            posY += 1
            posX -= 1
            pos = (posY * 8) + posX
            if (obj.tab[pos] == 0) {
                good = false
            }
            if (see_color == false && obj.tab[pos] == colorInv && good) {
                see_color = true
            } else if (see_color && obj.tab[pos] == color && good) {
                bg = true
            }
        }

        if (h == true) {
            NSLog("h : %d", h)
        }
        if (b == true) {
            NSLog("b : %d", b)
        }
        if (g == true) {
            NSLog("g : %d", g)
        }
        if (d == true) {
            NSLog("d : %d", d)
        }
        if (hg == true) {
            NSLog("hg : %d", hg)
        }
        if (bd == true) {
            NSLog("bd : %d", bd)
        }
        if (hd == true) {
            NSLog("hd : %d", hd)
        }
        if (bg == true) {
            NSLog("bg : %d", bg)
        }
        
        NSLog("-------------------------")
        
        if (h == true || b == true || g == true || d == true || hg == true || hd == true || bg == true || bd == true) {
            return true
        }
        
        return false
        
        //catch_pions(x, y: y, color: color)
    }
    
    func catch_pions(x: Int, y: Int, color: Int) {
        
        for (var i : Int = 1; i < 8; i += 1) {
         
            let pos : Int = (y * 8) + x
            
            if (h == true && (y - i) >= 0) { //haut
                if (obj.tab[pos - (8 * i)] != color) {
                    turnPion(pos - (8 * i))
                } else {
                    h = false
                }
            }
            if (b == true && (y + i) < 8) { // bas
                if (obj.tab[pos + (8 * i)] != color) {
                    turnPion(pos + (8 * i))
                } else {
                    b = false
                }
            }
            if (g == true && (x - i) >= 0) { // gauche
                if (obj.tab[pos - i] != color) {
                    turnPion(pos - i)
                } else {
                    g = false
                }
                
            }
            if (d == true && (x + i) < 8) { // droite
                NSLog("%d et color : %d", obj.tab[pos + i], color)
                if (obj.tab[pos + i] != color) {
                    turnPion(pos + i)
                } else {
                    d = false
                }
            }
            if (hg == true && (x - i) >= 0 && (y - i) >= 0) {
                if (obj.tab[pos - (9 * i)] != color) {
                    turnPion(pos - (9 * i))
                } else {
                    hg = false
                }
            }
            if (hd == true && (x + i) < 8 && (y - i) >= 0) {
                if (obj.tab[pos - (7 * i)] != color) {
                    turnPion(pos - (7 * i))
                } else {
                    hd = false
                }
            }
            if (bg == true && (x - i) >= 0 && (y + i) < 8) {
                if (obj.tab[pos + (7 * i)] != color) {
                    turnPion(pos + (7 * i))
                } else {
                    bg = false
                }
            }
            if (bd == true && (x + i) < 8 && (y + i) < 8) {
                if (obj.tab[pos + (9 * i)] != color) {
                    turnPion(pos + (9 * i))
                } else {
                    bd = false
                }
            }
            
        }
        
    }
    
    func turnPion(pos: Int) {
        if obj.tab[pos] == 1 {
            obj.tab[pos] = 2
            UIView.transitionFromView((obj.tabPrint[pos].subviews[0] as! UIImageView), toView: UIImageView(image: UIImage(named: "middleToWhite.png")), duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: { finished in
                
                UIView.transitionFromView((obj.tabPrint[pos].subviews[0] as! UIImageView), toView: UIImageView(image: UIImage(named: "pionBlanc.png")), duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil )
                
            })
        } else if obj.tab[pos] == 2 {
            obj.tab[pos] = 1
            UIView.transitionFromView((obj.tabPrint[pos].subviews[0] as! UIImageView), toView: UIImageView(image: UIImage(named: "middleToBlack.png")), duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: { finished in
                
                UIView.transitionFromView((obj.tabPrint[pos].subviews[0] as! UIImageView), toView: UIImageView(image: UIImage(named: "pionNoir.png")), duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil )
                
            })
        }
    }
    
}
