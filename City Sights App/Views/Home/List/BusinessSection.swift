//
//  BusinessSection.swift
//  City Sights App
//
//  Created by PM on 20/07/2021.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        Section (header: BusinessSectionHeader(title: title)) {
            ForEach (businesses) { business in
                NavigationLink (
                    destination: BusinessDetail(business: business),
                    label: {
                        BusinessRow(business: business)
                    })
                
            }
        }
    }
}
