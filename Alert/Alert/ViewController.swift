//
//  ViewController.swift
//  Alert
//
//  Created by 김태원 on 2022/03/04.
//

import UIKit

class ViewController: UIViewController{

    @IBAction func touchUpShowAlertButton(_ sender: UIButton){
        self.showAlertController(style:UIAlertController.Style.alert)
    }
    
    @IBAction func touchpShowActionSheetButton(_ sender: UIButton){
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    
    func showAlertController(style: UIAlertController.Style){
        let alertController: UIAlertController
        alertController = UIAlertController(title:"아무거나 누르든가", message: "난 모르겄다", preferredStyle: style)
        
        let okAction:UIAlertAction
        okAction = UIAlertAction(title: "OK", style:UIAlertAction.Style.default, handler: { (action: UIAlertAction) in print("OK pressed") })
        
        let cancelAction:UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        handler = {
            (action:UIAlertAction) in print("action pressed \(action.title ?? "")")
        }
        
        let someAction:UIAlertAction
        someAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        
        let anotherAction:UIAlertAction
        anotherAction = UIAlertAction(title: "Another", style: UIAlertAction.Style.default, handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        alertController.addTextField { (field:UITextField) in
            field.placeholder = "플레이스 홀더"
            field.textColor = UIColor.red
        }
        
        self.present(alertController, animated: true, completion: { print("Alert controller shown")
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

