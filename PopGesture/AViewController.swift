//
//  ViewController.swift
//  PopGesture
//
//  Created by youngseo on 2021/07/14.
//  Copyright © 2021 youngseo. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onPushBViewControllerButton(_ sender: Any) {
        if let bViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BViewController") as? BViewController {
            navigationController?.pushViewController(bViewController, animated: true)
        }
    }
    
}

