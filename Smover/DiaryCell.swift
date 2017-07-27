//
//  DiaryCell.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit

class DiaryCell: UICollectionViewCell {
    
    var diaryTitleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var diaryPreviewView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let diarySeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellProperties()
    }
    
    func setupCellProperties() {
        backgroundColor = .white
        addSubview(diaryTitleView)
        addSubview(diaryPreviewView)
        addSubview(diarySeperatorView)
        
        addDiaryTitleConstraints()
        addDiaryPreviewConstraints()
        addSeperatorView()
        
    }
    
    func addDiaryTitleConstraints() {
        let leftConstraint = NSLayoutConstraint(item: diaryTitleView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10)
        let topConstraint = NSLayoutConstraint(item: diaryTitleView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        let widthConstraint = NSLayoutConstraint(item: diaryTitleView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -20)
        let heightConstraint = NSLayoutConstraint(item: diaryTitleView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30)
        NSLayoutConstraint.activate([leftConstraint, topConstraint, widthConstraint, heightConstraint])
    }
    
    func addDiaryPreviewConstraints() {
        let leftConstraint = NSLayoutConstraint(item: diaryPreviewView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10)
        let topConstraint = NSLayoutConstraint(item: diaryPreviewView, attribute: .top, relatedBy: .equal, toItem: diaryTitleView, attribute: .bottom, multiplier: 1, constant: 10)
        let widthConstraint = NSLayoutConstraint(item: diaryPreviewView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -20)
        let bottomConstraint = NSLayoutConstraint(item: diaryPreviewView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10)
        NSLayoutConstraint.activate([leftConstraint, topConstraint, widthConstraint, bottomConstraint])
    }
    
    func addSeperatorView() {
        let rightConstriant = NSLayoutConstraint(item: diarySeperatorView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: diarySeperatorView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.9, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: diarySeperatorView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 1)
        let bottomConstraint = NSLayoutConstraint(item: diarySeperatorView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([rightConstriant, widthConstraint, heightConstraint, bottomConstraint])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
