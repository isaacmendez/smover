//
//  OptionsHeaderCell.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit

class OptionsHeaderCell: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
