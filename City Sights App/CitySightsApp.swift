//
//  CitySightsApp.swift
//  City Sights App
//
//  Created by PM on 19/07/2021.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
