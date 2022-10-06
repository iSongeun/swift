//
//  ViewController.swift
//  TodoApp
//
//  Created by 이송은 on 2022/10/04.
//

import UIKit
import CoreData

enum PriorityLevel : Int64{
    case level1
    case level2
    case level3
}

extension PriorityLevel{
    var color : UIColor{
        switch self {
        case .level1:
            return .green
        case .level2:
            return .orange
        case .level3:
            return .red
            
        }
    }
}

class ViewController: UIViewController {

    
    @IBOutlet weak var tableview: UITableView!
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var todolist = [TodoList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "To do List"
        makeNavi()

        fetchData()
        tableview.reloadData()
    }

    func fetchData(){
        
        let fetchrequest : NSFetchRequest<TodoList> = TodoList.fetchRequest()
        //데이터 가져오기
        let context = appdelegate.persistentContainer.viewContext
        
        
        do {
            self.todolist = try context.fetch(fetchrequest)
            
        }catch{
            print(error)
        }
    }
    
    
    
    @objc func addNewTodo(){
        print("add")
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true)
    }

    
    func makeNavi(){
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        navigationItem.rightBarButtonItem = item
    }
}

class TodoCell : UITableViewCell {
    
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    
    
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todolist.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        cell.detailTitle.text = todolist[indexPath.row].title
        
        if let hasDate = todolist[indexPath.row].date{
            let formatter = DateFormatter()
            
            formatter.dateFormat = "MM-dd hh:mm:ss"
            let dataString = formatter.string(from: hasDate)
            
            cell.topTitle.text = dataString
            
        }
        else{
            cell.topTitle.text = ""
        }
        
        let priority = todolist[indexPath.row].priorityLevel
        let priorityColor = PriorityLevel(rawValue: priority)?.color
        cell.priorityView.backgroundColor = priorityColor
        cell.priorityView.layer.cornerRadius = cell.priorityView.bounds.height/2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //didSelectRowAt - 눌렀을 때
        todolist[indexPath.row]
        
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        detailVC.selectedTodoList = todolist[indexPath.row]
        self.present(detailVC, animated: true)
        
    }
    
}

extension ViewController : TodoDetailViewControllerDelegate {
    func didFinishSaveData() {
        self.fetchData()
        self.tableview.reloadData()
    }
    
    
}
