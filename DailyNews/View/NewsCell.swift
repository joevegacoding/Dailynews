//
//  SearchCell.swift
//  DailyNews
//
//  Created by Joseph Bouhanef on 2020-11-16.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
