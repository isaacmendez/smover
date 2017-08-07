//
//  HomeViewController.swift
//  Smover
//
//  Created by Laurie Gray on 18/07/2017.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewTitle = "Smover"
    
    let scrollViewContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
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
        self.navigationController?.topViewController?.navigationItem.rightBarButtonItems = nil
    }
    
    func setupHomeView() {
        view.backgroundColor = UIColor.white
        title = viewTitle
        
        // Add UI Views
        view.addSubview(scrollViewContainer)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":scrollViewContainer]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":scrollViewContainer]))
        self.navigationController?.topViewController?.navigationItem.rightBarButtonItems = nil
    }

}
