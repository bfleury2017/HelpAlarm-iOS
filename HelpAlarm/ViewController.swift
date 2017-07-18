//
//  ViewController.swift
//  HelpAlarm
//
//  Created by Brian on 7/17/17.
//  Copyright © 2017 Fleury Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func phoneAction(_ sender: Any) {
//        let delegate = UIApplication.shared.delegate as? AppDelegate

        guard let number = URL(string: "tel://6032304000") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(number)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

