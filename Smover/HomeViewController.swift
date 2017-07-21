//
//  HomeViewController.swift
//  Smover
//
//  Created by Laurie Gray on 18/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewTitle = "Smover"
    
    let scrollViewContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHomeView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.topViewController?.title = viewTitle
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    func setupHomeView() {
        view.backgroundColor = UIColor.white
        title = viewTitle
        
        // Add UI Views
        view.addSubview(scrollViewContainer)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":scrollViewContainer]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":scrollViewContainer]))
        
    }

}
