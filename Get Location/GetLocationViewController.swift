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
    var locationString: String?
    
    var getLocationView: GetLocationView {
        return view as! GetLocationView
    }
    
    override func loadView() {
        view = GetLocationView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocationView.getLocationButton.addTarget(self, action: #selector(getLocationButtonPressed), for: .touchUpInside)
        getLocationView.shareAndDisplayLocationView.shareLocationButton.addTarget(self, action: #selector(shareLocationButtonPressed), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkLocationServices()
    }
    
    @objc func getLocationButtonPressed() {
        checkLocationAuthorization(calledByButtonPressed: true)
    }
    
    @objc func shareLocationButtonPressed() {
        guard let locationString: String = locationString else { return }
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [locationString], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
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
            createAlert(with: "Location Services", and: "Please turn on location services")
        }
    }
    
    func createAlert(with title: String, and message: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alertAction) in
            alert.dismiss(animated: false, completion: nil)
        }))
        self.present(alert, animated: false, completion: nil)
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
            createAlert(with: "Location Services", and: "Location Services is turned off for this application.")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            createAlert(with: "Location Services Restrictions", and: "Location Services is restricted e.g. Parental Restrictions")
        @unknown default:
            break
        }
    }
}

extension GetLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = locations.last else { return }
        locationString = "\(location.coordinate.latitude), \(location.coordinate.longitude)"
        getLocationView.displayLocation(at: locationString!)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization(calledByButtonPressed: false)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
