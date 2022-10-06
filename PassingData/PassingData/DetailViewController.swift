//
//  DetailViewController.swift
//  PassingData
//
//  Created by 이송은 on 2022/07/20.
//

import UIKit

class DetailViewController: UIViewController {

    var somestring = "안녕하세요"
    
    @IBOutlet weak var someLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        someLabel.text = somestring
    }




}
