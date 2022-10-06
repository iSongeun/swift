//
//  ViewController.swift
//  Graph
//
//  Created by 이송은 on 2022/08/16.
//

import UIKit

extension NSLayoutConstraint {
    func changeMultiplier(value : CGFloat) -> NSLayoutConstraint {
        DispatchQueue.main.async {
            NSLayoutConstraint.deactivate([self])

            let newLayoutConstraints = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
            
            newLayoutConstraints.priority = self.priority
            newLayoutConstraints.shouldBeArchived = self.shouldBeArchived
            newLayoutConstraints.identifier = self.identifier
            NSLayoutConstraint.activate([newLayoutConstraints])
            
            return newLayoutConstraints
        }
        

    }
}

class ViewController: UIViewController {

    @IBOutlet weak var gr1Height: NSLayoutConstraint!
    @IBOutlet weak var gr2Height: NSLayoutConstraint!
    @IBOutlet weak var gr3Height: NSLayoutConstraint!
    @IBOutlet weak var gr4Height: NSLayoutConstraint!
    @IBOutlet weak var gr5Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
      
        
         super.viewDidLoad()
    }
    @IBAction func btn1(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5){
            self.gr1Height.changeMultiplier(value: 0.7)
            self.gr2Height.changeMultiplier(value: 0.2)
            self.gr3Height.changeMultiplier(value: 0.5)
            self.gr4Height.changeMultiplier(value: 0.6)
            self.gr5Height.changeMultiplier(value: 0.9)
            
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func btn2(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5){
            self.gr1Height.changeMultiplier(value: 0.1)
            self.gr2Height.changeMultiplier(value: 0.9)
            self.gr3Height.changeMultiplier(value: 0.3)
            self.gr4Height.changeMultiplier(value: 0.3)
            self.gr5Height.changeMultiplier(value: 0.8)
           
            self.view.layoutIfNeeded()
        }

        

    }
    
}

