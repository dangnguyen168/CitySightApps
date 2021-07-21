//
//  BusinessDetail.swift
//  City Sights App
//
//  Created by PM on 20/07/2021.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    @State private var showDirections = false
    
    var body: some View {
        VStack (alignment:.leading) {
            
            VStack(alignment: .leading, spacing: 0) {
                GeometryReader(){ geo in
                    // Image
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
                // Status
                ZStack (alignment:.leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
            }
            
            
            Group {
                    BusinessTitle(business: business)
                        .padding()
                    
                    Divider()
                    // Phone, Review, Website
                    HStack {
                        Text("Phone: ")
                            .bold()
                        Text(business.phone ?? "")
                        Spacer()
                        Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                        Divider()
                    }
                    .padding()
                    HStack {
                        Text("Reviews: ")
                            .bold()
                        Text(String(business.reviewCount ?? 0))
                        Spacer()
                        Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                        Divider()
                    }
                    .padding()
                    HStack {
                        Text("Website: ")
                            .bold()
                        Text(business.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                        Divider()
                    }
                    .padding()
                }
            // Get Direction Button
            Button {
               showDirections = true
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                    Text ("Get Direction")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()
            .sheet(isPresented: $showDirections){
                DirectionsView(business: business)
            }
        }
    }
}
