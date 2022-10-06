//
//  ViewController.swift
//  PassingData
//
//  Created by 이송은 on 2022/07/20.
//

// 데이터 넘겨주는 방법
// 1. instance property에 데이터 전송
// 2. segue way
// 3. instance
// 4. delegate pattern
// 5. closure
// 6. notification

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dataLabel: UIView!
    
    @IBOutlet weak var datadata: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let notificationName = Notification.Name("sendSomeString")
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
    }
    @objc func showSomeString(notification : Notification){
        if let str = notification.userInfo?["str"] as? String {
            self.datadata.text = str
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? segueDetailViewController{
                detailVC.dataString = "aaaaa"
            }
        }
    }

    @IBAction func movetoDetail(_ sender: Any) {
        
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        self.present(detailVC, animated: true, completion: nil)
        
    }
    
    @IBAction func moveToInstance(_ sender: Any) {
        
        let detailVC = instanceDetailViewController(nibName: "instanceDetailViewController", bundle: nil)
        
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName : "DelegateDetailViewController", bundle : nil)
        
        detailVC.delegate = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        detailVC.myClosure = {str in
            self.datadata.text = str
        }
        
        self.present(detailVC, animated: true, completion: nil)
        
        
    }
    @IBAction func moveToNotification(_ sender: Any) {
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController : DelegateDetailViewControllerDelegate{
    
    
    func passString(string: String) {
        self.datadata.text = string
    }
}
