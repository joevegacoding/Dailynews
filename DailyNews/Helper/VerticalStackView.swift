//
//  VerticalStackView.swift
//  Newspaper
//
//  Created by Joseph Bouhanef on 2020-11-15.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubViews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach ({ addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
