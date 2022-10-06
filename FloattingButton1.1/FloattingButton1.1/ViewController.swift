//
//  ViewController.swift
//  FloattingButton1.1
//
//  Created by 이송은 on 2022/08/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup" {
            let floatingVC = segue.destination as! FloatingButtonViewController
            floatingVC.modalPresentationStyle = .overCurrentContext
        }
    }

    
}

