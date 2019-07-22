//
//  GetLocationViewController.swift
//  Get Location
//
//  Created by tominaga on 7/15/19.
//  Copyright © 2019 Naoki Tominaga. All rights reserved.
//

import UIKit
import CoreLocation

class GetLocationViewController: UIViewController {
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    var getLocationView: GetLocationView {
        return view as! GetLocationView
    }
    
    override func loadView() {
        view = GetLocationView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocationView.getLocationButton.addTarget(self, action: #selector(getLocationButtonPressed), for: .touchUpInside)
        checkLocationServices()
    }
    
    @objc func getLocationButtonPressed() {
        checkLocationAuthorization(calledByButtonPressed: true)
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization(calledByButtonPressed: false)
        }
        else {
            // Show alert that location services disabled
        }
    }
    
    func checkLocationAuthorization(calledByButtonPressed: Bool) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            if calledByButtonPressed {
                locationManager.requestLocation()
            }
        case .authorizedAlways:
            break
        case .denied:
            // show alert on how to turn on location services
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // show alert that restrictions are placed
            break
        @unknown default:
            break
        }
    }
}

extension GetLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = locations.last else { return }
        getLocationView.displayLocation(at: "\(location.coordinate.latitude), \(location.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization(calledByButtonPressed: false)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
