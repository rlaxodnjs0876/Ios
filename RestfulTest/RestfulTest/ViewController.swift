//
//  ViewController.swift
//  RestfulTest
//
//  Created by 김태원 on 2022/06/14.
//

import UIKit
import Pods_RestfulTest

class ViewController: UIViewController {
    
    @IBOutlet weak var responseView: UILabel!
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBAction func post(_ sender: Any) {
            
            // 바디에 넣을 데이터 생성
            let bodyParam = "userId=\(self.id.text!)&name=\(self.name.text!)"
            let body = bodyParam.data(using: .utf8)
     
            // URL 객체 정의
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
     
            // 1) REQ - 라인 설정
            var req = URLRequest(url: url!)
            req.httpMethod = "POST"
                    
            // 2) REQ - 헤더 설정
            req.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type") // POST
            req.setValue(String(body!.count), forHTTPHeaderField: "Content-Length") // 서버에 길이 알림
     
            // 3) REQ - 바디 설정
            req.httpBody = body
     
            // 서버에 전송
            URLSession.shared.dataTask(with: req) {(data, response, error) in
                
                // error 체크
                if let e = error {
                    print(e.localizedDescription)
                    return
                }
                
                
                
                DispatchQueue.main.async {
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                        guard let jsonObj = json else {return}
                        
                        let result = jsonObj["result"] as? String
                        let id = jsonObj["userId"] as? String
                        let name = jsonObj["name"] as? String
                        
                        if result == "SUCCESS" {
                            // data 확인
                            print("결과==>\(String(data: data!, encoding: .utf8)!)")
                            
                            // responseView는 @IBOulet변수
                            self.responseView.text = "아이디 = \(String(id!))\n"
                                                    + "이름 = \(String(name!))\n"
                            
                        }
                        
                    } catch let e as NSError {print(e.localizedDescription)}
                }
                
                
            }.resume() // resume()을 해야 전송이 됨 : URLSession.shared.dataTask(...)객체
        }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
}

