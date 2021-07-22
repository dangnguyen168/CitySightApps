//
//  LocationDeniedView.swift
//  City Sights App
//
//  Created by PM on 22/07/2021.
//

import SwiftUI

struct LocationDeniedView: View {
    
    private let background = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        VStack(spacing:20){
            Spacer()
            Text("Whoops!")
                .font(.title)
            Text("We need to access your location to provide you with the best sights in the city. You can change your decision at any time in Settings.")
            Spacer()
            Button {
                // MARK: Open Settings
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        // If we can open this settings url, then open it
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    Text("Go to Settings")
                        .bold()
                        .foregroundColor(background)
                }
                .padding()
            }
            Spacer()
        }
        multilineTextAlignment(.center)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
