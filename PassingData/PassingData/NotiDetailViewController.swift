//
//  NotiDetailViewController.swift
//  PassingData
//
//  Created by 이송은 on 2022/07/21.
//

import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func notiAction(_ sender: Any) {
        
        let notificationName = Notification.Name("sendSomeString")
        
        let strDic = ["str" : "noti string"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
        
        self.dismiss(animated: true)
    }
}
