//
//  MealBanner.swift
//  MealsDB
//
//  Created by Omkar Nikhal on 7/6/24.
//

import SwiftUI
import Kingfisher

/// A view representing the header section of meal details.
struct MealBanner: View {
    
    /// The details of the meal to display in the header.
    let details: MealDetail

    var body: some View {
        ZStack {
            if let imageURLString = details.imageURLString {
                KFImage(URL(string: imageURLString))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .opacity(Constants.Sizes.detailsImageOpacity)
                    .cornerRadius(Constants.Sizes.detailsImageCornerRadius)
            }

            VStack {
                Spacer()
                if let name = details.title {
                    Text(name)
                        .font(.system(size: Constants.Sizes.mainTitleSize))
                        .fontDesign(.serif)
                        .minimumScaleFactor(Constants.Sizes.titleScaleFactor)
                        .bold()
                        .padding(Constants.Paddings.detailsTitle)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(Constants.Sizes.detailsTitleOpacity))
                        .padding(.bottom, Constants.Paddings.detailsTitleBottom)
                }
            }
        }
    }
}

