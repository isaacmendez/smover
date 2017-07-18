//
//  HomeViewController.swift
//  Smover
//
//  Created by Laurie Gray on 18/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHomeView()
    }
    
    func setupHomeView() {
        view.backgroundColor = UIColor.white
        title = "Smover"
    }
    
}
