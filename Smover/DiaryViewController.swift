//
//  DiaryViewController.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit
import CoreData

class DiaryViewController: UICollectionViewController {
    
    let viewTitle = "Diary"
    let diaryCellID = "diaryCellID"
    var fetchedResultsController: NSFetchedResultsController<DiaryEntry>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDiaryView()
        collectionView?.register(DiaryCell.self, forCellWithReuseIdentifier: diaryCellID)
        collectionView?.showsVerticalScrollIndicator = false
        
        setupFetchedResultsController()
        do {
            try fetchedResultsController?.performFetch()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let addButton =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addDiaryEntry))
        
        self.navigationController?.topViewController?.title = viewTitle
        self.navigationController?.topViewController?.navigationItem.setRightBarButton(addButton, animated: true)
    }
    
    func setupDiaryView() {
        title = viewTitle
        collectionView?.backgroundColor = .white
        
    }
    
    func addDiaryEntry() {
        let detailView = DiaryDetailView()
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        title = viewTitle
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: CoreData import of the diary entries

extension DiaryViewController: NSFetchedResultsControllerDelegate {
    
    func setupFetchedResultsController() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<DiaryEntry> = DiaryEntry.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
    }
}

// MARK: CollectionView Delegate Methods

extension DiaryViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return fetchedResultsController?.sections?.count ?? 0
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // We'll stick to one section for now
//        return fetchedResultsController?.sections?[0].numberOfObjects ?? 0
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let diaryCell = collectionView.dequeueReusableCell(withReuseIdentifier: diaryCellID, for: indexPath) as! DiaryCell
        
        return diaryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 50.0, right: 0)
    }
}




