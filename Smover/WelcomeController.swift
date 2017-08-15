//
//  ViewController.swift
//  Smover
//
//  Created by Laurie Gray on 18/07/2017.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWelcomeView()
        
    }

    func setupWelcomeView() {
        view.backgroundColor = UIColor.white
        title = "Welcome to Smover"
    }


}

