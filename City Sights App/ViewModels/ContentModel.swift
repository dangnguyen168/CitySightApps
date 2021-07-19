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
        let userLocation = locations.first
        
        if userLocation != nil {
            // We have a location
            // Stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            
            // If we have the coordinates of the user, send into Yelp API
            getBusinesses(category: "arts", location: userLocation!)
        }
    }
    
    // MARK: Yelp API method
    func getBusinesses(category: String, location: CLLocation){
        
        // Create URL
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        let url =  urlComponents?.url
        
        if let url = url {
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            
            request.httpMethod = "GET"
            request.addValue("Bearer CuaOaJz-nFd_5ygFJKLt0b92hFZ1unQ2fgf2pHfyqAQ2VJt9Ha_YjWUfUog84HNidgqVJv4QKwgXFMXpMAuCI38xQW6EL1smSknShUaGiLMFlnxe5oTsEHpFOy_1YHYx", forHTTPHeaderField: "Authorization")
            // Get URL Session
            let session = URLSession.shared
            // Create Data Task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    print(response)
                }
            }
            // Start the data task
            dataTask.resume()
        }
        
    
    }
}
