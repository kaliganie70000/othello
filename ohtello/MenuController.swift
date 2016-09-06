//
//  MenuController.swift
//  ohtello
//
//  Created by Antoine roy on 15/06/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    @IBOutlet var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // var g : Bool = false
        
        self.btn.transform = CGAffineTransformMakeRotation(CGFloat(-(20.0*M_PI/180.0)))
        
        UIView.animateWithDuration(1, delay: 0, options: [UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat] , animations: {
                self.btn.transform = CGAffineTransformMakeRotation(CGFloat(20.0*M_PI/180.0))
            }, completion: { finished in

        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toto(sender: AnyObject) {
        btn.backgroundColor = UIColor.yellowColor()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
