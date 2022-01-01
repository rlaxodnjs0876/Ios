//
//  ViewController.swift
//  iOS 기초
//
//  Created by 김태원 on 2021/12/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var PlayPauseButton:UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        print("button paused")
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("slider Value Changed")
    }
}

