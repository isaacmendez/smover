//
//  OptionsViewController.swift
//  Smover
//
//  Created by Laurie Gray on 21/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit
import CoreData

class OptionsViewController: UICollectionViewController {
    
    let viewTitle = "Options"
    let headerCellID = "optionsHeaderCellID"
    let optionCellID = "optionCellID"
    
    var isCodTurkeyMode: Bool?
    
    let optionsToggle: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        return switchView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOptionsView()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.register(SingleOption.self, forCellWithReuseIdentifier: optionCellID)
        
        collectionView?.register(OptionsHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellID)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.topViewController?.title = viewTitle
    }
    
    // MARK: Supplementary Views
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellID, for: indexPath) as! OptionsHeaderCell
        
        if kind == UICollectionElementKindSectionHeader {
           
//            headerCell.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 100)
            return headerCell
        }
        return headerCell
    }
    

    func setupOptionsView() {
        title = viewTitle
        collectionView?.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barStyle = .black
    }
    
}

// MARK: UICollectionView Implementation

extension OptionsViewController: UICollectionViewDelegateFlowLayout {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let singleOptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: optionCellID, for: indexPath) as! SingleOption
        
        return singleOptionCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
}
