//
//  TodaysLocation.swift
//  Remote-Work
//
//  Created by Eyüp Mert for having some fun.
//

import SwiftUI

struct TodaysLocation: View {
    @State private var companyYouWorkFor = "Your Company If You Share"
    @State private var yourMood = "Calm and productive"
    @State private var locationYouWishToBe = "As you wish"
    @State private var buttonText = "Submit"
    @State private var backgroundImageIndex = 0

    let backgroundImages = ["beach", "boxer", "homeOffice", "lego", "notebooks"]

    var body: some View {
        ZStack {
            Image(backgroundImages[backgroundImageIndex])
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(alignment: .leading) {
                Text(companyYouWorkFor)
                    .font(.title)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .bold()
                
                Text(yourMood)
                    .font(.headline)
                    .padding()
                    .background(Color.white.opacity(0.8))
                
                Spacer().frame(minHeight: 20)
                
                VStack(alignment: .leading) {
                    LocationView(systemName: "globe", text: locationYouWishToBe)
                    CompanyNameView(text: companyYouWorkFor)
                    ProjectTitleView(text: yourMood)
                    
                    Button(action: {
                        toggleBackgroundImage()
                    }) {
                        Text(buttonText)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding()
                
            }
        }
    }
    
    func toggleBackgroundImage() {
        backgroundImageIndex = (backgroundImageIndex + 1) % backgroundImages.count
    }
}

struct LocationView: View {
    let systemName: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: systemName)
                .imageScale(.large)
                .foregroundColor(.blue)
                .padding()
            
            Text(text)
                .padding()
                .background(Color.white.opacity(0.8))
        }
    }
}

struct CompanyNameView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(Color.white.opacity(0.8))
    }
}

struct ProjectTitleView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(Color.white.opacity(0.8))
    }
}

struct TodaysLocation_Previews: PreviewProvider {
    static var previews: some View {
        TodaysLocation()
    }
}
