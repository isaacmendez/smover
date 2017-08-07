//
//  DiaryViewController.swift
//  Smover
//
//  Created by Laurie Gray on 27/07/2017.
//

import UIKit
import CoreData

class DiaryViewController: UICollectionViewController {
    
    let viewTitle = "Diary"
    let diaryCellID = "diaryCellID"
    let transition = AddEntryViewTransition()
    var fetchedResultsController: NSFetchedResultsController<DiaryEntry>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDiaryView()
        collectionView?.register(DiaryCell.self, forCellWithReuseIdentifier: diaryCellID)
        collectionView?.showsVerticalScrollIndicator = false
        
        setupFetchedResultsController()
        do {
            try fetchedResultsController?.performFetch()
            collectionView?.reloadData()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let addButton =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addDiaryEntry))
        
        self.navigationController?.topViewController?.title = viewTitle
        self.navigationController?.topViewController?.navigationItem.setRightBarButton(addButton, animated: true)
        self.navigationController?.topViewController?.navigationItem.setLeftBarButton(nil, animated: true)
    }
    
    func setupDiaryView() {
        title = viewTitle
        collectionView?.backgroundColor = .white
    }
    
    func addDiaryEntry() {
        let detailView = DiaryDetailView()
        detailView.transitioningDelegate = self
//        let detailView = storyboard!.instantiateViewController(withIdentifier: "DetailView") as! DetailController
        present(detailView, animated: true, completion: nil) // Uses the new Transition
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
        // We'll stick to one section for now
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // We'll stick to one section for now
        return fetchedResultsController?.sections?[0].numberOfObjects ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let diaryCell = collectionView.dequeueReusableCell(withReuseIdentifier: diaryCellID, for: indexPath) as! DiaryCell
        
        if let currentDiaryEntry = fetchedResultsController?.fetchedObjects {
            let entry = currentDiaryEntry[indexPath.item] as DiaryEntry
            diaryCell.diaryTitleView.text = entry.title
            diaryCell.diaryPreviewView.text = entry.entryBody
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            
            if let date = entry.date as? Date {
                let displayDate = dateFormatter.string(from: date)
                diaryCell.diaryDateView.text = "\(displayDate)"
            }
        }
        return diaryCell
    }
    
    // MARK: Cell Selection
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedCell = fetchedResultsController?.object(at: indexPath) {
            let selectedEntry = selectedCell as DiaryEntry
            let diaryDetailView = DiaryDetailView()
            diaryDetailView.diaryEntry = selectedEntry
            diaryDetailView.transitioningDelegate = self
            navigationController?.pushViewController(diaryDetailView, animated: true)
        }
    }
    
    
    
    
    // MARK: Layout of Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 50.0, right: 0)
    }
}


// MARK: Handle the changes in the Collection View when an entry is made

extension DiaryViewController {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .insert {
            let _ = navigationController?.popViewController(animated: true)
            collectionView?.insertItems(at: [newIndexPath!])
            collectionView?.scrollToItem(at: newIndexPath!, at: .top, animated: true)
        }
    }
}


extension DiaryViewController: UIViewControllerTransitioningDelegate {
 
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }

}

