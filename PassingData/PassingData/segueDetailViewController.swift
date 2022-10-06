//
//  segueDetailViewController.swift
//  PassingData
//
//  Created by 이송은 on 2022/07/20.
//

import UIKit

class segueDetailViewController: UIViewController {

    @IBOutlet weak var datalabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datalabel.text = dataString

    }
    

   
}
