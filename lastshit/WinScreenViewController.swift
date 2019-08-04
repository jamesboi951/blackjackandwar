//
//  WinScreenViewController.swift
//  lastshit
//
//  Created by James Boisvert on 7/25/19.
//  Copyright © 2019 James Boisvert. All rights reserved.
//

import UIKit

class WinScreenViewController: UIViewController {
    
    
    @IBOutlet weak var event_label: UILabel!
    
    var neo = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        event_label.text = neo

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
