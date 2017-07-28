//
//  SingleOption.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit

class SingleOption: UICollectionViewCell {
    
    let optionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        return label
    }()
    
    lazy var optionToggle: UISwitch = {
        let optionSwitch = UISwitch()
        optionSwitch.translatesAutoresizingMaskIntoConstraints = false
        optionSwitch.addTarget(self, action: #selector(handleSwitchChange(_:)), for: UIControlEvents.valueChanged)
        return optionSwitch
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(optionText)
        addSubview(optionToggle)
        
        applyOptionTextConstraints()
        applyOptionToggleConstraints()
        
        setupOptionValues()
    }
    
    func setupOptionValues() {
        optionToggle.isOn = OptionsLoader.isColdTurkeyActive()
    }
    
    func applyOptionToggleConstraints() {
        let leftConstraint = NSLayoutConstraint(item: optionText, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20)
        let topConstraint = NSLayoutConstraint(item: optionToggle, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: optionToggle, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstriant = NSLayoutConstraint(item: optionText, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([leftConstraint, topConstraint, bottomConstraint, heightConstriant])
    }
    
    func applyOptionTextConstraints() {
        let rightConstraint = NSLayoutConstraint(item: optionToggle, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -20)
        let topConstraint = NSLayoutConstraint(item: optionToggle, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: optionToggle, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstriant = NSLayoutConstraint(item: optionToggle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([rightConstraint, topConstraint, bottomConstraint, heightConstriant])
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
