//
//  ViewController.swift
//  HTTPTest
//
//  Created by Felipe Valencia  on 8/16/18.
//  Copyright © 2018 Felipe Valencia . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var response: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getRequest(_ sender: UIButton) {
        let url = URL(string: "http://localhost:8081/calculate?fname=Felipe&&sname=Hello")
    }
    
}

