//
//  OptionsHeaderCell.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//

import UIKit

class OptionsHeaderCell: UICollectionReusableView {
    
    var headerTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 20)
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(colorLiteralRed: 20/255, green: 20/255, blue: 20/255, alpha: 1.0)
    
        addSubview(headerTitle)
        addHeaderTitleConstraints()
    }
    
    func addHeaderTitleConstraints() {
        let widthConstraint = NSLayoutConstraint(item: headerTitle, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: headerTitle, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 20)
        let centerXConstraint = NSLayoutConstraint(item: headerTitle, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: headerTitle, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([widthConstraint, heightConstraint, centerXConstraint, centerYConstraint])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
