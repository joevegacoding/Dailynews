//
//  SearchViewController.swift
//  DailyNews
//
//  Created by Joseph Bouhanef on 2020-11-16.
//

import UIKit
import SDWebImage

fileprivate let reuseIdentifier = "Cell"

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate var newsResults = [Articles?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .tertiarySystemGroupedBackground
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        fetchNews()
        
    }
    
    fileprivate func fetchNews() {
        Service.shared.fetchNews { (results, error)  in
            
            if let error = error {
                print("Failed to fetch articles: " , error)
                return
            }
            self.newsResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 155)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsResults.count
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchCell
        
        let newResults = newsResults[indexPath.item]
        cell.titleLabel.text = newResults?.title
        cell.imageView.sd_setImage(with: URL(string: newResults?.urlToImage ?? ""))
        
        
        return cell
    }
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
