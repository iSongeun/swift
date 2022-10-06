//
//  instanceDetailViewController.swift
//  PassingData
//
//  Created by 이송은 on 2022/07/20.
//

import UIKit

class instanceDetailViewController: UIViewController {

    
    var mainVC : ViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func sendDataMainVC(_ sender: Any) {
        //get from mainVC
        mainVC?.datadata.text = "some data"
        self.dismiss(animated: true)
        
    }
    
}
