//
//  GetLocationView.swift
//  Get Location
//
//  Created by tominaga on 7/16/19.
//  Copyright © 2019 Naoki Tominaga. All rights reserved.
//

import UIKit

class GetLocationView: UIView {
    
    let getLocationButton: UIButton = UIButton(type: .system)
    let shareAndDisplayLocationView: ShareAndDisplayLocationView = ShareAndDisplayLocationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        getLocationButton.setTitle("Get Location", for: .normal)
        addSubview(getLocationButton)
        shareAndDisplayLocationView.isHidden = true
        addSubview(shareAndDisplayLocationView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        let buttonAndLabelWidthPercentage: CGFloat = 0.5
        let buttonAndLabelHeightPercentage: CGFloat = 0.1
        let buttonAndLabelWidth: CGFloat = buttonAndLabelWidthPercentage * bounds.width
        let buttonAndLabelHeight: CGFloat = buttonAndLabelHeightPercentage * bounds.height
        getLocationButton.frame = CGRect(x: (bounds.width - buttonAndLabelWidth)/2, y: (bounds.height - buttonAndLabelHeight)/2, width: buttonAndLabelWidth, height: buttonAndLabelHeight)
        shareAndDisplayLocationView.frame = CGRect(x: 0, y: (bounds.height - buttonAndLabelHeight)/2 + buttonAndLabelHeight, width: bounds.width, height: buttonAndLabelHeight)
    }
    
    func displayLocation(at location: String) {
        shareAndDisplayLocationView.isHidden = false
        shareAndDisplayLocationView.locationLabel.text = location
    }
}
