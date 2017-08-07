//
//  DiaryDetailView.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//

import UIKit
import CoreData

class DiaryDetailView: UIViewController, UIViewControllerTransitioningDelegate {
    
    var diaryEntry: DiaryEntry?
    
    lazy var dismissViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.dismissView), for: .touchUpInside)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    lazy var saveNoteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.saveNote), for: .touchUpInside)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    let diaryNotetitle: UITextField = {
        let inputView = UITextField()
        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.backgroundColor = UIColor.init(white: 0.85, alpha: 1.0)
        inputView.placeholder = "Enter Title Here"
        return inputView
    }()
    
    let diaryNoteTextView:UITextField = {
        let inputView = UITextField()
        inputView.translatesAutoresizingMaskIntoConstraints = false
        inputView.backgroundColor = UIColor.init(white: 0.95, alpha: 1.0)
        inputView.placeholder = "Enter Note Here"
        inputView.enablesReturnKeyAutomatically = true
        inputView.contentVerticalAlignment = .top
        return inputView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        checkForDiaryEntry()
        
        view.addSubview(dismissViewButton)
        view.addSubview(saveNoteButton)
        view.addSubview(diaryNotetitle)
        view.addSubview(diaryNoteTextView)
        
        applyNavigationConstraints()
        applyDiaryTitleConstraints()
        applyDiaryNoteConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkForDiaryEntry()
    }
    
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func saveNote() {
        saveDiaryEntry()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDiaryEntry))
        self.navigationController?.topViewController?.navigationItem.setRightBarButton(saveBarButton, animated: true)
    }
    
    func checkForDiaryEntry() {
        if let diaryEntry = diaryEntry {
            self.diaryNotetitle.text = diaryEntry.title
            self.diaryNoteTextView.text = diaryEntry.entryBody
        }
    }
    
    func saveDiaryEntry() {
        // Some checks before saving
        guard diaryNotetitle.text != nil else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        let diaryEntry = NSEntityDescription.insertNewObject(forEntityName: "DiaryEntry", into: context) as? DiaryEntry
        
        diaryEntry?.date = NSDate()
        diaryEntry?.title = diaryNotetitle.text
        diaryEntry?.entryBody = diaryNoteTextView.text
        
        do {
            try context.save()
            dismiss(animated: true, completion: nil)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func applyNavigationConstraints() {
        let dismissLeftConstraint = NSLayoutConstraint(item: dismissViewButton, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10)
        let dismissTopConstraint = NSLayoutConstraint(item: dismissViewButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 20)
        let dismissHeightConstraint = NSLayoutConstraint(item: dismissViewButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 40)
        
        let saveTopConstraint = NSLayoutConstraint(item: saveNoteButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 20)
        let saveRightConstraint = NSLayoutConstraint(item: saveNoteButton, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: -10)
        let saveHeightConstraint = NSLayoutConstraint(item: saveNoteButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([dismissLeftConstraint, dismissTopConstraint, dismissHeightConstraint])
        NSLayoutConstraint.activate([saveTopConstraint, saveRightConstraint, saveHeightConstraint])
    }
    
    func applyDiaryTitleConstraints() {
        let leftConstraint = NSLayoutConstraint(item: diaryNotetitle, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 10)
        let topConstraint = NSLayoutConstraint(item: diaryNotetitle, attribute: .top, relatedBy: .equal, toItem: dismissViewButton, attribute: .bottom, multiplier: 1, constant: 10)
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
