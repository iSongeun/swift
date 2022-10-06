//
//  ViewController.swift
//  penGesture
//
//  Created by 이송은 on 2022/09/06.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var myTextfield: UITextField!
    @IBOutlet weak var confirm: UIButton!
    let btn = UIButton()
    let txtField = UITextField()
    
    var fontsize : Double = 16
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        drawing()
        

    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(Sizing(pan:)))
        let panDrag = UIPanGestureRecognizer(target: self, action: #selector(dragging(pan:)))
        self.btn.addGestureRecognizer(pan)
        self.txtField.addGestureRecognizer(panDrag)
        
    }
    func drawing(){
        
        txtField.center = self.view.center
        txtField.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
        txtField.backgroundColor = .clear
        txtField.layer.borderWidth = 1
        txtField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        txtField.text = "hollywood"
        txtField.textAlignment = .center
        txtField.sizeToFit()

        btn.bounds = CGRect(x:  0 , y: 0, width: 30, height: 30)
        btn.center = CGPoint(x:  txtField.bounds.width/2 + txtField.center.x  , y: txtField.bounds.height/2 + txtField.center.y  )
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 15
  


        self.view.addSubview(txtField)
        self.view.addSubview(btn)

    }
    
    @IBAction func btnclick(_ sender: Any) {
        
        txtField.text = myTextfield.text
        txtField.sizeToFit()
        
        btn.center.x = txtField.center.x + txtField.bounds.width/2
        btn.center.y = txtField.center.y + txtField.bounds.height/2
        
        if btn.center.x < txtField.center.x {
            btn.center.x = txtField.center.x
        }
        if btn.center.y < txtField.center.y{
            btn.center.y = txtField.center.y
        }
    }
    
    @objc func Sizing(pan : UIPanGestureRecognizer){

        switch pan.state{
        case .began:
            print("began")
        case .ended, .cancelled:
            print("ended")

        case .changed:
            //부모뷰의 넓이와 높이 비율을 center에 맞춰서 변경
            //print("changed")
            let delta = pan.translation(in: txtField) //txtfield의 움직임
            var myposition = btn.center //self의 위치

            //            //self의 위치 재조정
            myposition.x += delta.x
            myposition.y += delta.y
//
//            //txtfield
            btn.center = myposition
            txtField.frame.size.width += delta.x
            txtField.frame.size.height += delta.y


            //폰트사이즈 함께 키움
            let doubleValue = Double(delta.x)
            var doubleValue2 = Double(fontsize)
            doubleValue2 = doubleValue2 + doubleValue/5
            fontsize = doubleValue2
            txtField.font = UIFont(name: "arial", size: fontsize)

            
            //txtfield 사이즈 폰트
            
            txtField.sizeToFit()
            
            btn.center.x = txtField.center.x + txtField.bounds.width/2
            btn.center.y = txtField.center.y + txtField.bounds.height/2
            
            if btn.center.x < txtField.center.x {
                btn.center.x = txtField.center.x
            }
            if btn.center.y < txtField.center.y{
                btn.center.y = txtField.center.y
            }
            pan.setTranslation(CGPoint.zero, in: txtField)

        default:
            break


        }


    }
    
    @objc func dragging(pan : UIPanGestureRecognizer){
        
        switch pan.state {
        case .began:
            print("began") //누르는 순간
            
        case .changed: //눌러서 움직일 때, 움직인 만큼 가야함 움직이는 개념
            //좌우 상하 움직임 누른 상태에서 움직임
            
            //let ratio = 1:2
            let delta = pan.translation(in: txtField.superview)
            var myposition = txtField.center
            
                myposition.x += delta.x
                myposition.y += delta.y

            
            txtField.center = myposition
            
            //화면 밖으로 못나가게 하는 코드
            if txtField.frame.minX < 0{
                txtField.frame.origin.x = 0
            }
            
            if let hasSuperViewMaxX = txtField.superview {
                if txtField.frame.maxX > hasSuperViewMaxX.frame.maxX{
                    txtField.frame.origin.x = hasSuperViewMaxX.frame.maxX - txtField.bounds.width //max - self.width
                }
            }
            
            if txtField.frame.minY < 0 {
                txtField.frame.origin.y = 0
            }
            
            if let hasSuperViewMaxY = txtField.superview {
                if txtField.frame.maxY > hasSuperViewMaxY.frame.maxY{
                    txtField.frame.origin.y = hasSuperViewMaxY.frame.maxY - txtField.bounds.height
                }
            }
            
            //버튼 좌표가 뷰 안쪽 선 넘어가면 못 움직이게 예외처리
            pan.setTranslation(CGPoint.zero, in: txtField.superview) //움직인 만큼 센터 초기화
            
            btn.center.x += delta.x
            btn.center.y += delta.y
        
            if btn.center.x < txtField.center.x + txtField.bounds.width/2 || btn.center.x > txtField.center.x + txtField.bounds.width/2{
                btn.center.x = txtField.center.x + txtField.bounds.width/2
            }
            if btn.center.y < txtField.center.y + txtField.bounds.height/2 || btn.center.y > txtField.center.y + txtField.bounds.height/2{
                btn.center.y = txtField.center.y + txtField.bounds.height/2
            }
            
            
            
        case .ended, .cancelled:
        
            print("ended")
            
            
            
        default:
            break
            
        
        }
    }
}
   
