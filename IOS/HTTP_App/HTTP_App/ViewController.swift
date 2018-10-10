//
//  ViewController.swift
//  HTTP_App
//
//  Created by Felipe Valencia  on 9/20/18.
//  Copyright © 2018 Felipe Valencia . All rights reserved.
//
import Alamofire
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var result: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var butt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        translateSpanish()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        translateSpanish()
    }
    @IBAction func translate(_ sender: UIButton) {
        translateSpanish()
 
    }
    func translateSpanish() {
        let text_area = textField.text
        let params = text_area!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        print(params ?? "Hello")
        let url = "http://localhost:8081/translate?str="+params!
        print(url)
        Alamofire.request(url).responseJSON { response in
            if let data = response.data, let utf8 = String(data: data, encoding: .utf8) {
                self.result.text = utf8
                print(utf8)
            }
            
        }
    }
}
