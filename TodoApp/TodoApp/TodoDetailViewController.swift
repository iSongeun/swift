//
//  TodoDetailViewController.swift
//  TodoApp
//
//  Created by 이송은 on 2022/10/05.
//

import UIKit
import CoreData

protocol TodoDetailViewControllerDelegate : AnyObject {
    func didFinishSaveData()
}

class TodoDetailViewController: UIViewController {
    
    weak var delegate : TodoDetailViewControllerDelegate?

    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    var priority = PriorityLevel.init(rawValue: 0)
    
    var selectedTodoList : TodoList?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func viewDidLayoutSubviews() {
        
            super.viewDidLayoutSubviews()
            btn1.layer.cornerRadius = btn1.bounds.height / 2
            btn2.layer.cornerRadius = btn2.bounds.height / 2
            btn3.layer.cornerRadius = btn3.bounds.height / 2
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hasData = selectedTodoList{
            titleTF.text = hasData.title
            
            priority = PriorityLevel(rawValue: hasData.priorityLevel)
            btnDelete.isHidden = false
            btnSave.setTitle("update", for: .normal)
        }else{
            btnDelete.isHidden = true
            btnSave.setTitle("save", for: .normal)
        }
        
        
    }
    @IBAction func click(_ sender: UIButton) {
        
        switch sender.tag{
        case 1:
            print("1")
            priority = .level1
        case 2:
            print("2")
            priority = .level2
        case 3:
            print("3")
            priority = .level3
        default:
            break
        }
        makePriorityBtn()
    }
    
    func makePriorityBtn(){
        
        
        btn1.backgroundColor = .clear
        btn2.backgroundColor = .clear
        btn3.backgroundColor = .clear

        switch self.priority{
        case .level1:
            btn1.backgroundColor = priority?.color
        case .level2:
            btn2.backgroundColor = priority?.color
        case .level3:
            btn3.backgroundColor = priority?.color
        default:
            break
        }
        
        
    }
    
    @IBAction func btnsave(_ sender: Any) {
        if selectedTodoList != nil{
            updateTodo()
        }else{
            saveTodo()
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
        
    }
    
    @IBAction func btndelete(_ sender: Any) {
        deleteTodo()
    }
    
    func saveTodo(){
        //data
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else {return}
        
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? TodoList else {return}
        //what is context
        
        object.title = titleTF.text
        object.date = Date()
        object.uuid = UUID()
        
        object.priorityLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
        

//priority
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
    }
    
    func updateTodo(){
        
        guard let hasData = selectedTodoList else{
            return
        }
        
        guard let hasUUID = hasData.uuid else{
            return
        }
        
        let fetchRequest: NSFetchRequest <TodoList> = TodoList.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do{
         let loadedData = try context.fetch(fetchRequest)
            loadedData.first?.title = titleTF.text
            loadedData.first?.date = Date()
            loadedData.first?.priorityLevel = self.priority?.rawValue ?? PriorityLevel.level1.rawValue
            
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
            appDelegate.saveContext()
            
        }catch{
            print(error)
        }
    }
    
    func deleteTodo(){
        
        guard let hasData = selectedTodoList else{
            return
        }
        
        guard let hasUUID = hasData.uuid else{
            return
        }
        
        let fetchRequest: NSFetchRequest <TodoList> = TodoList.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do{
         let loadedData = try context.fetch(fetchRequest)
        
            if let loadFirstData = loadedData.first{
                context.delete(hasData)
                let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
                appDelegate.saveContext()
            }
        }catch{
            print(error)
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
        
    }
}
