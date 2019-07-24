//
//  ShareAndDisplayLocationView.swift
//  Get Location
//
//  Created by tominaga on 7/24/19.
//  Copyright © 2019 Naoki Tominaga. All rights reserved.
//

import UIKit

class ShareAndDisplayLocationView: UIView {
    
    let locationLabel: UILabel = UILabel()
    let shareLocationButton: UIButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        locationLabel.textAlignment = .center
        addSubview(locationLabel)
        shareLocationButton.setTitle("Share", for: .normal)
        addSubview(shareLocationButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        let labelWidthPercentage: CGFloat = 0.5
        let labelWidth: CGFloat = labelWidthPercentage * bounds.width
        let labelHeight: CGFloat = bounds.height
        locationLabel.frame = CGRect(x: (bounds.width - labelWidth)/2, y: 0, width: labelWidth, height: labelHeight)
        shareLocationButton.frame = CGRect(x: (bounds.width - labelWidth)/2 + labelWidth, y: 0, width: bounds.width - ((bounds.width - labelWidth)/2 + labelWidth), height: bounds.height)
    }
    
}
