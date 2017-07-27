//
//  OptionsViewController.swift
//  Smover
//
//  Created by Laurie Gray on 21/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit
import CoreData

class OptionsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let viewTitle = "Options"
    
    var isCodTurkeyMode: Bool?
    
    
    let optionsToggle: UISwitch = {
        let sw = UISwitch()
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOptionsView()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.topViewController?.title = viewTitle
    }
    
    func setupOptionsView() {
        view.backgroundColor = UIColor.white
        title = viewTitle
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
