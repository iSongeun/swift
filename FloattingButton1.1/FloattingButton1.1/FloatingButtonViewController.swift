//
//  FloatingButtonViewController.swift
//  FloattingButton1.1
//
//  Created by 이송은 on 2022/08/16.
//

import UIKit

class FloatingButtonViewController: UIViewController {
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    
    @IBOutlet weak var btn1Y: NSLayoutConstraint!
    @IBOutlet weak var btn2Y: NSLayoutConstraint!
    @IBOutlet weak var btn3Y: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
    }
    
    func design(){
        btn1Y.constant = 0
        btn2Y.constant = 0
        btn3Y.constant = 0
    }

    @IBAction func btmDismiss(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.btn1Y.constant = 0
            self.btn2Y.constant = 0
            self.btn3Y.constant = 0
            
            self.view.layoutIfNeeded()
            
        }) { (completion) in
            self.dismiss(animated: false)
        }
        
    }
    
    //화면이 모두 나온 시점
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.btn1Y.constant = 80
            self.btn2Y.constant = 160
            self.btn3Y.constant = 240
            
            self.view.layoutIfNeeded()
            
        }) { (completion) in
            
        }
        
    }
   
    
}

