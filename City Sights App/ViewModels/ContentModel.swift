//
//  ContentModel.swift
//  City Sights App
//
//  Created by PM on 19/07/2021.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, ObservableObject, CLLocationManagerDelegate {
   
    var locationManager = CLLocationManager()
    
    override init(){
        super.init()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        // Request permission from the user
        // Add key in Info.plist -> Privacy - Location Always and When In Use Usage Description
        locationManager.requestWhenInUseAuthorization()
        
   
        
    }
        // MARK: Location manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            // We have permission
            // Start Geo Locating the user, after we get permission
            locationManager.startUpdatingLocation()
            
        }
        else if locationManager.authorizationStatus == .denied {
            // We don't have permission
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Give us the location of the user
        
        // Stop requesting the location after we get it once
        locationManager.stopUpdatingLocation()
    }
}
