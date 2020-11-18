//
//  NewsCell.swift
//  DailyNews
//
//  Created by Joseph Bouhanef on 2020-11-16.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "SpaceX"))
        imgView.backgroundColor = .systemRed
        imgView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 360).isActive = true
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        return imgView
    }()
    
    let titleLabel: UILabel = {
        let textView = UILabel()
        textView.text = "Elon Musk Just Dropped the Bitcoin Bomb in Twitter… Again"
        textView.textAlignment = .center
        textView.font = UIFont(name: "Helvetica-Bold", size: 20)
        textView.numberOfLines = 0
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, imageView])
        stackView.axis  = .vertical
        stackView.spacing =  12
        stackView.alignment = .center
        addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: -16, right: -16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
