//
//  SingleOption.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//

import UIKit

class SingleOption: UICollectionViewCell {
    
    let optionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Set Cold Turkey Mode Active"
        return label
    }()
    
    lazy var optionToggle: UISwitch = {
        let optionSwitch = UISwitch()
        optionSwitch.translatesAutoresizingMaskIntoConstraints = false
        optionSwitch.addTarget(self, action: #selector(handleSwitchChange(_:)), for: UIControlEvents.valueChanged)
        return optionSwitch
    }()
    
    let optionSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(optionText)
        addSubview(optionToggle)
        addSubview(optionSeperatorView)
        
        applyOptionTextConstraints()
        applyOptionToggleConstraints()
        addSeperatorViewConstraints()
        
        setupOptionValues()
    }
    
    func setupOptionValues() {
        optionToggle.isOn = OptionsLoader.isColdTurkeyActive()
    }
    
    
    
    func applyOptionTextConstraints() {
        let leftConstraint = NSLayoutConstraint(item: optionText, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20)
        let heightConstriant = NSLayoutConstraint(item: optionText, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: optionText, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([leftConstraint, heightConstriant, centerYConstraint])
    }
    
    func applyOptionToggleConstraints() {
        let rightConstraint = NSLayoutConstraint(item: optionToggle, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -20)
        let centerYConstraint = NSLayoutConstraint(item: optionToggle, attribute: .centerY, relatedBy: .equal, toItem: optionText, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([rightConstraint, centerYConstraint])
    }
    
    func addSeperatorViewConstraints() {
        let rightConstriant = NSLayoutConstraint(item: optionSeperatorView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: optionSeperatorView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.9, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: optionSeperatorView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 1)
        let bottomConstraint = NSLayoutConstraint(item: optionSeperatorView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([rightConstriant, widthConstraint, heightConstraint, bottomConstraint])
    }
    
    func handleSwitchChange(_ switchValue:UISwitch) {
    
        OptionsLoader.setColdTurkeyMode(withValue: switchValue.isOn)
    }
    
    // Pull all options and settings from the data model
    // Populate the cells with supplementary views
    // Write save methods
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
