//
//  LaunchView.swift
//  City Sights App
//
//  Created by PM on 19/07/2021.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // Detect the authorization status of geolocating the user
        
        if model.authorizationState == .notDetermined {
            // If not determined, Show onboarding flow
            OnBoardingView()
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            // If authorized, show home view
            HomeView()
        }
        else {
            // If denied, show denied view
            LocationDeniedView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
