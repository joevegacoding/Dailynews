//
//  SearchViewController.swift
//  DailyNews
//
//  Created by Joseph Bouhanef on 2020-11-16.
//

import UIKit

class NewsViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .brown
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) FontNames: \(names)")
        }


    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//SearchViewController
//NewsViewController
