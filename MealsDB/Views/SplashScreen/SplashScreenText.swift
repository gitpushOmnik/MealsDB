//
//  SplashScreenText.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import SwiftUI

/// A view representing the content displayed during the splash screen.
struct SplashScreenText: View {
    
    @State var animatedText: String = ""
    
    var body: some View {
        ZStack {
            Color(Constants.Strings.secondaryColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(animatedText)
                    .font(.system(size: Constants.Sizes.splashScreenText,
                                  weight: .bold, design: .serif))
                    .foregroundColor(Color(Constants.Strings.primaryColor))
                    .padding()
                
                Image(systemName: Constants.Strings.forkKnifeIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.Sizes.splashScreenImage,
                           height: Constants.Sizes.splashScreenImage)
                    .foregroundColor(Color(Constants.Strings.primaryColor))
                    .padding()
            }
        }
        .onAppear{
            animateText()
        }
    }
    
    /// Animates the text during the splash screen.
    func animateText() {
        for (index, character) in Constants.Strings.splashScreenTitle.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                animatedText.append(character)
            }
        }
    }
}
