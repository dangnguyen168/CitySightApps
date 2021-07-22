//
//  OnBoardingView.swift
//  City Sights App
//
//  Created by PM on 22/07/2021.
//

import SwiftUI

struct OnBoardingView: View {
    
    @EnvironmentObject var model:ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        VStack {
            TabView(selection: $tabSelection){
                // First tab
                VStack(spacing: 20) {
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sights!")
                        .bold()
                        .font(.title)
                    Text("City Sights helps you find the best of the city!")
                        
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
                .tag(0)
                
                // Second tab
                VStack(spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues and more based on your location!")
                        
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode:.always))
            
            // Button
            Button {
                if tabSelection == 0 {
                    tabSelection = 1
                }
                else {
                    // Request for geo location permission
                    model.requestGeoLocationPermission()
                }
                
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next" : "Get my location")
                        .bold()
                        .padding()
                }
            }
            .accentColor(tabSelection == 0 ? blue: turquoise)
            .padding()
            Spacer()
        }
        .background(tabSelection == 0 ? blue : turquoise)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
