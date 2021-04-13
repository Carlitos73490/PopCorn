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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }

    private func setupView(){
        monLabel.text = "Je m'appel " + monNom + " et j'ai " + String(monAge) + "ans"
        //myimageview.Image = UIImage(named: "icon_caddy_off")
    }

    @IBAction func myButtonDidTouch(_ sender: UIButton) {
        monAge += 1
        monLabel.text = "Je m'appel " + monNom + " et j'ai " + String(monAge) + "ans"
    }
}

