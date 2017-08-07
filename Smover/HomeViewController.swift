//
//  HomeViewController.swift
//  Smover
//
//  Created by Laurie Gray on 18/07/2017.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewTitle = "Smover"
    
    let timeSavedCalculator = TimeSavedCalculator()
    
    lazy var scrollViewContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let lifeSavedView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Smover-Logo-Full"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let lifeSavedLabelView: UILabel = {
        let label = UILabel()
        label.text = "You have saved:"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.init(white: 0.25, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lifeSavedTimeView: UILabel = {
        let label = UILabel()
        label.text = "30 Days, 29 Minutes"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor(colorLiteralRed: 255/255, green: 58/255, blue: 20/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHomeView()
        fetchTimeSaved()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.topViewController?.title = viewTitle
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let resistedBarButtonItem = UIBarButtonItem(title: "Resisted!", style: .plain, target: self, action: #selector(addResistedAction))
        self.navigationController?.topViewController?.navigationItem.setRightBarButton(resistedBarButtonItem, animated: true)
        
        let gaveInBarButtonItem = UIBarButtonItem(title: "Gave In", style: .plain, target: self, action: #selector(addGaveInAction))
        self.navigationController?.topViewController?.navigationItem.setLeftBarButton(gaveInBarButtonItem, animated: true)
        
    }
    
    func addResistedAction() {
        
    }
    
    func addGaveInAction() {
        
    }
    
    func fetchTimeSaved() {
        self.lifeSavedTimeView.text = timeSavedCalculator.printTimeSaved()
    }
    
    func setupHomeView() {
        view.backgroundColor = UIColor.white
        title = viewTitle
        
        // Add Views
        view.addSubview(scrollViewContainer)
        scrollViewContainer.addSubview(lifeSavedView)
        scrollViewContainer.addSubview(lifeSavedLabelView)
        scrollViewContainer.addSubview(lifeSavedTimeView)
        // Add Constraints
        addScrollViewConstriants()
        addLifeSavedViewConstraints()
        addLifeSavedLabelViewContstraints()
        addLifeSavedTimeViewConstraints()
        
    }
    
    func addScrollViewConstriants() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":scrollViewContainer]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":scrollViewContainer]))
    }

    func addLifeSavedViewConstraints() {
        let topConstraint = NSLayoutConstraint(item: lifeSavedView, attribute: .top, relatedBy: .equal, toItem: self.scrollViewContainer, attribute: .top, multiplier: 1, constant: 10)
        let heightConstraint = NSLayoutConstraint(item: lifeSavedView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 200)
        let widthConstraint = NSLayoutConstraint(item: lifeSavedView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: -20)
        let centerXConstraint = NSLayoutConstraint(item: lifeSavedView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, heightConstraint, widthConstraint, centerXConstraint])
    }
    
    func addLifeSavedLabelViewContstraints() {
        let topConstraint = NSLayoutConstraint(item: lifeSavedLabelView, attribute: .top, relatedBy: .equal, toItem: lifeSavedView, attribute: .bottom, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: lifeSavedLabelView, attribute: .width, relatedBy: .equal, toItem: lifeSavedView, attribute: .width, multiplier: 1, constant: 0)
        let centerXConstraint = NSLayoutConstraint(item: lifeSavedLabelView, attribute: .centerX, relatedBy: .equal, toItem: lifeSavedView, attribute: .centerX, multiplier: 1, constant: 0)
       
        NSLayoutConstraint.activate([ topConstraint ,centerXConstraint ,widthConstraint])
    }
    
    func addLifeSavedTimeViewConstraints() {
        let topConstraint = NSLayoutConstraint(item: lifeSavedTimeView, attribute: .top, relatedBy: .equal, toItem: lifeSavedLabelView, attribute: .bottom, multiplier: 1, constant: 10)
        let widthConstraint = NSLayoutConstraint(item: lifeSavedTimeView, attribute: .width, relatedBy: .equal, toItem: lifeSavedLabelView, attribute: .width, multiplier: 1, constant: 0)
        let centerXConstraint = NSLayoutConstraint(item: lifeSavedTimeView, attribute: .centerX, relatedBy: .equal, toItem: lifeSavedLabelView, attribute: .centerX, multiplier: 1, constant: 0)
        let bottomConstriant = NSLayoutConstraint(item: lifeSavedTimeView, attribute: .bottom, relatedBy: .equal, toItem: scrollViewContainer, attribute: .bottom, multiplier: 1, constant: 10)
        
        NSLayoutConstraint.activate([ topConstraint ,centerXConstraint ,widthConstraint, bottomConstriant])
    }
}
