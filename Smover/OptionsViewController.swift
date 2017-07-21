//
//  OptionsViewController.swift
//  Smover
//
//  Created by Laurie Gray on 21/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit
import CoreData

class OptionsViewController: UITableViewController {
    
    let viewTitle = "Options"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barStyle = .black
        setupOptionsView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.topViewController?.title = viewTitle
    }
    
    func setupOptionsView() {
        view.backgroundColor = UIColor.white
        title = viewTitle
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        self.title = viewTitle
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
