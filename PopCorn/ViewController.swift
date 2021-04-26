//
//  ViewController.swift
//  PopCorn
//
//  Created by Carl Fuchs on 13/04/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monLabel: UILabel!
    var monAge : Int = 0
    var monNom : String = "Carl"
    var urlBA : String = "https://www.youtube.com/watch?v=YIx4nbTSV_Q"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    @IBAction func play(_ sender: Any) {
        print("test");
        if let url = URL(string: urlBA) {
            UIApplication.shared.open(url)
        }
    }
    

    
}

