//
//  BViewController.swift
//  PopGesture
//
//  Created by youngseo on 2021/07/14.
//  Copyright © 2021 youngseo. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onPushCViewController(_ sender: Any) {
        if let cViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CViewController") as? CViewController {
            navigationController?.pushViewController(cViewController, animated: true)
        }
    }
    
}
