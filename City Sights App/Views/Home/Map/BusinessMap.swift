//
//  BusinessMap.swift
//  City Sights App
//
//  Created by PM on 21/07/2021.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    var locations: [MKPointAnnotation] {
        var annotation = [MKPointAnnotation]()
        
        // Create a set of annotations from our list of businesses
        for business in model.restaurants + model.sights {
            // If the business has a lat/long, create a MKPoint Annotation for it
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                // Create a new annotation
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotation.append(a)
            }
        }
        return annotation
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        // Make the user show on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading

        return mapView
        
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove all annotation
        uiView.removeAnnotations(uiView.annotations)
        // Add the ones based on the business
//        uiView.addAnnotations(self.locations)
        uiView.showAnnotations(self.locations, animated: true)
        
    }
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
}
