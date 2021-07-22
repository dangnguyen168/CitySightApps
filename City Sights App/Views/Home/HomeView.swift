//
//  HomeView.swift
//  City Sights App
//
//  Created by PM on 20/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness: Business?
    
    var body: some View {
        if model.restaurants.count != 0 || model.sights.count != 0 {
           
            NavigationView {
                // Determine if we should show list or map
                if !isMapShowing {
                    // show list
                    VStack (alignment: .leading){
                        HStack {
                            Image(systemName: "location")
                            Text(model.placemark?.locality ?? "")
                            Spacer()
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        ZStack (alignment:.top) {
                            BusinessList()
                            HStack{
                                Spacer()
                                YelpAttribution(link: "https://yelp.ca")
                            }.padding(.trailing, -20)
                        }
                        
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    
                    ZStack (alignment: .top) {
                        // show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                BusinessDetail(business: business)
                            }
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(height: 48)
                                .cornerRadius(5.0)
                            HStack {
                                Image(systemName: "location")
                                Text(model.placemark?.locality ?? "")
                                Spacer()
                                Button("Switch to list view") {
                                    self.isMapShowing = false
                                }
                            }
                            .padding()
                        }
                        .padding()
                    }
                }
            }
        }
        else {
            // Still waiting for data so show spinner
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
