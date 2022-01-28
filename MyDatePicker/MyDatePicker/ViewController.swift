//
//  ViewController.swift
//  MyDatePicker
//
//  Created by 김태원 on 2022/01/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel:UILabel!
    let dateFormatter: DateFormatter = {
        let formatter : DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender : UIDatePicker){
        print("value change")
        
        let date : Date = self.datePicker.date
        let dateString : String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    }


}

