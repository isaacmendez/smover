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
        return label
    }()
    
    let optionToggle: UISwitch = {
        let optionSwitch = UISwitch()
        optionSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        return optionSwitch
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func handleSwitchChange() {
        
    }
    
    // Pull all options and settings from the data model
    // Populate the cells with supplementary views
    // Write save methods
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
