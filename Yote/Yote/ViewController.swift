//
//  ViewController.swift
//  Yote
//
//  Created by Felipe Valencia  on 8/28/18.
//  Copyright © 2018 Felipe Valencia . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var namename: UILabel!
    @IBOutlet weak var yotefield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yotefield.delegate = self
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        yotefield.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        namename.text = yotefield.text
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Actions

    @IBAction func YoteButt(_ sender: UIButton) {
        yotefield.text = "Hey..."
        
    }
}

