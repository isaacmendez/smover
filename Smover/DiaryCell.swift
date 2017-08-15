//
//  DiaryCell.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//

import UIKit

class DiaryCell: UICollectionViewCell {
    
    var diaryTitleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var diaryPreviewView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var diaryDateView: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.init(white: 0.5, alpha: 1.0)
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
        addSubview(diaryDateView)
        addSubview(diarySeperatorView)
        
        addDiaryTitleConstraints()
        addDiaryPreviewConstraints()
        addDiaryDateConstraints()
        addSeperatorView()
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.init(red: 20/255, green: 20/255, blue: 20/200, alpha: 0.5) : .white
        }
    }
    
    func addDiaryTitleConstraints() {
        let leftConstraint = NSLayoutConstraint(item: diaryTitleView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10)
        let topConstraint = NSLayoutConstraint(item: diaryTitleView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: diaryTitleView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -30)
        let heightConstraint = NSLayoutConstraint(item: diaryTitleView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30)
        NSLayoutConstraint.activate([leftConstraint, topConstraint, widthConstraint, heightConstraint])
    }
    
    func addDiaryPreviewConstraints() {
        let leftConstraint = NSLayoutConstraint(item: diaryPreviewView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10)
        let topConstraint = NSLayoutConstraint(item: diaryPreviewView, attribute: .top, relatedBy: .equal, toItem: diaryTitleView, attribute: .bottom, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: diaryPreviewView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -30)
        let bottomConstraint = NSLayoutConstraint(item: diaryPreviewView, attribute: .bottom, relatedBy: .equal, toItem: diaryDateView, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([leftConstraint, topConstraint, widthConstraint, bottomConstraint])
    }
    
    func addDiaryDateConstraints() {
        let leftConstraint = NSLayoutConstraint(item: diaryDateView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10)
        let topConstraint = NSLayoutConstraint(item: diaryDateView, attribute: .top, relatedBy: .equal, toItem: diaryPreviewView, attribute: .bottom, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: diaryDateView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -30)
        let bottomConstraint = NSLayoutConstraint(item: diaryDateView, attribute: .bottom, relatedBy: .equal, toItem: diarySeperatorView, attribute: .bottom, multiplier: 1, constant: -5)
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
