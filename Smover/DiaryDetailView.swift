//
//  DiaryDetailView.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit
import CoreData

class DiaryDetailView: UIViewController {
    
    let diaryNotetitle: UITextField = {
        let inputView = UITextField()
        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.backgroundColor = .green
        inputView.placeholder = "Enter Title Here"
        return inputView
    }()
    
    let diaryNoteTextView:UITextField = {
        let inputView = UITextField()
        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.backgroundColor = .red
        inputView.placeholder = "Enter Note Here"
        return inputView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        view.addSubview(diaryNotetitle)
        view.addSubview(diaryNoteTextView)
        applyDiaryTitleConstraints()
        applyDiaryNoteConstraints()
        
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDiaryEntry))
        self.navigationController?.topViewController?.navigationItem.setRightBarButton(saveBarButton, animated: true)
    }
    
    func saveDiaryEntry() {
        // Some checks before saving
        guard diaryNotetitle.text != nil else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        let diaryEntry = NSEntityDescription.insertNewObject(forEntityName: DiaryEntry.description(), into: context) as? DiaryEntry
        
        diaryEntry?.date = NSDate()
        diaryEntry?.entryBody = diaryNoteTextView.text
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func applyDiaryTitleConstraints() {
        let leftConstraint = NSLayoutConstraint(item: diaryNotetitle, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10)
        let topConstraint = NSLayoutConstraint(item: diaryNotetitle, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 75)
        let rightConstraint = NSLayoutConstraint(item: diaryNotetitle, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: -10)
        let heightConstraint = NSLayoutConstraint(item: diaryNotetitle, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([leftConstraint, topConstraint, rightConstraint, heightConstraint])
        
    }
    
    func applyDiaryNoteConstraints() {
        let leftConstraint = NSLayoutConstraint(item: diaryNoteTextView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10)
        let topConstraint = NSLayoutConstraint(item: diaryNoteTextView, attribute: .top, relatedBy: .equal, toItem: diaryNotetitle, attribute: .bottom, multiplier: 1, constant: 10)
        let widthConstrint = NSLayoutConstraint(item: diaryNoteTextView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: -20)
        let bottomConstrait = NSLayoutConstraint(item: diaryNoteTextView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -10)
        
        NSLayoutConstraint.activate([leftConstraint, topConstraint, widthConstrint, bottomConstrait])
    }
    
}
