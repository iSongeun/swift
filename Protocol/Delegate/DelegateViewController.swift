//
//  DelegateViewController.swift
//  Protocol
//
//  Created by 이송은 on 2022/09/15.
//

import UIKit

protocol DelegateViewControllerDelegate{
    func passString(string : String)
}



class DelegateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
