//
//  DelegateDetailViewController.swift
//  PassingData
//
//  Created by 이송은 on 2022/07/21.
//

import UIKit

protocol DelegateDetailViewControllerDelegate : AnyObject{
    func passString(string : String)
}
class DelegateDetailViewController: UIViewController {

    weak var delegate : DelegateDetailViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func passDataToMainVC(_ sender: Any) {
        
        delegate?.passString(string: "delegate pass data")
        self.dismiss(animated: true)
    }
}
