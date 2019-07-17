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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        getLocationButton.setTitle("Get Location", for: .normal)
        addSubview(getLocationButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
