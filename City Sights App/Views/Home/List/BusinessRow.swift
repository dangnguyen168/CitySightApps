//
//  BusinessRow.swift
//  City Sights App
//
//  Created by PM on 20/07/2021.
//

import SwiftUI

struct BusinessRow: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
        VStack {
            HStack {
                // Image
                let uiImage = UIImage(data: business.imageData ?? Data())
                
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(5.0)
                    .scaledToFit()
                // Name and Distance
                VStack (alignment: .leading) {
                    Text(business.name ?? "")
                        .bold()
                    Text(String(format: "%.1f km away", (business.distance ?? 0)/1000))
                        .font(.caption)
                }
                Spacer()
                // Rating and numbers of reviews
                VStack (alignment:.leading) {
                    Image("regular_\(business.rating ?? 0.0)")
                    Text("\(business.reviewCount ?? 0) Reviews ")
                        .font(.caption)
                }
            }
            DashedDivider()
                .padding(.horizontal)
        }
            .foregroundColor(.black)
    }
}
