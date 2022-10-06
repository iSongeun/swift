//
//  ClosureDetailViewController.swift
//  PassingData
//
//  Created by 이송은 on 2022/07/21.
//

import UIKit

class ClosureDetailViewController: UIViewController {

    var myClosure: ((String) -> Void)? = nil     //받는 거 없고 주는 거 없다 ~
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }

    @IBAction func closurePassData(_ sender: Any) {
        
        myClosure?("closure string")
        self.dismiss(animated: true)
    }
    
}
