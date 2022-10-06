//
//  ViewController.swift
//  ExpandCell1.2
//
//  Created by 이송은 on 2022/08/02.
//

import UIKit

class ExpandCell : UITableViewCell {
    
    @IBOutlet weak var labelforlabel: UILabel!
    
}

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    struct ExpandDataModel{
        var description : String
        var isExpand : Bool
    }
    
    var dataModels = [ExpandDataModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        
        cell.labelforlabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.labelforlabel.numberOfLines = 0
        }else{
            cell.labelforlabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    let textArray = ["short text", "long long long long long long long long long long long long text",
                     "short text", "long long long long long long long long long long long long text",
                     "short text", "long long long long long long long long long long long long text",
                     "short text", "long long long long long long long long long long long long text",
                     "short text", "long long long long long long long long long long long long text",
                     "short text", "long long long long long long long long long long long long text"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for (_,value) in textArray.enumerated() {
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
        
    
    
    }


}

