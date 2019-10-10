//
//  ViewController.swift
//  TrainingTools
//
//  Created by Ludovic Ollagnier on 09/10/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!

    //Tableau d'outlets
    @IBOutlet var buttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        for b in buttons {
            b.isHidden = false
        }

        view.backgroundColor = UIColor(named: "purplePink")
    }

    @IBAction func sayHello(_ sender: UIButton) {

        sender.isEnabled.toggle()

    }

    func doSomething(with age: Int?) {

        // age non nil
        // age > 0
        // age < 100
        guard let age = age, age > 0, age < 100 else { return }
        var me = User(firstName: "Ludovic", lastName: "Ollagnier")
        me.age = age
    }

}

