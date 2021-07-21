//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by PM on 21/07/2021.
//

import SwiftUI

struct BusinessTitle: View {
    var business: Business
    var body: some View {
        VStack (alignment: .leading) {
            Text (business.name!)
                .bold()
                .font(.largeTitle)
                
            
            // Loop through display address
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id:\.self) { displayLine in
                    Text (displayLine)
                
                }
            }
            // Rating
            Image("regular_\(business.rating ?? 0)")
                
        }
    }
}
