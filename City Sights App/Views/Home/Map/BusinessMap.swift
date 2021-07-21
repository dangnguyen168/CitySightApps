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
        mapView.delegate = context.coordinator
        
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
    
    // MARK: Coordinate class
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            // if the annotation is an user blue dot, return nil
            if annotation is MKUserLocation {
                return nil
            }
            
            // Check if there's a reusable annotation view first
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
            
            if annotationView == nil {
                // Create an new annotation
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            else {
                // We got a reusable one
                annotationView!.annotation = annotation
            }
            
            // Return it
            return annotationView
        }
    }
}
