//
//  GetLocationViewController.swift
//  Get Location
//
//  Created by tominaga on 7/15/19.
//  Copyright © 2019 Naoki Tominaga. All rights reserved.
//

import UIKit

class GetLocationViewController: UIViewController {
    
    var getLocationView: GetLocationView {
        return view as! GetLocationView
    }
    
    override func loadView() {
        view = GetLocationView()
    }
    
    override func viewDidLoad() {
        getLocationView.getLocationButton.addTarget(self, action: #selector(getLocationButtonPressed), for: .touchUpInside)
    }
    
    @objc func getLocationButtonPressed() {
        print("hi")
    }
}
