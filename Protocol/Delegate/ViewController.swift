//
//  ViewController.swift
//  Protocol
//
//  Created by 이송은 on 2022/09/15.
//

//프로토콜 - 규격
import UIKit

protocol UserInfo{
    var name : String {get set}
    var age : Int {get set}
    
    func isAdult() -> Bool
    
    
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClick(_ sender: Any) {
        
        
        
    }
    
}

