//
//  CardView.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 05/05/2024.
//

import Foundation
import SwiftUI

struct CardView: View {
    let meal: Any? // Define meal as Any type
    
    var body: some View {
        HStack {
            if let mealModel = meal as? MealModel? {
                // If meal is of type MealModel, display the details
                AsyncImage(url: URL(string: mealModel?.strMealThumb ?? ""), scale: 2) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle(), style: FillStyle())
                VStack(alignment: .leading) {
                    Text(mealModel?.strMeal ?? "Meal Name")
                        .font(.headline)
                    Spacer()
                    HStack {
                        Label(mealModel?.strArea ?? "Meal Area", systemImage: "person.3")
                        Spacer()
                        Label(mealModel?.idMeal ?? "Meal id", systemImage: "clock")
                            .labelStyle(.titleOnly)
                    }
                    .font(.caption)
                }
                .padding(10)
            } else if let mealLiteModel = meal as? MealLiteModel? {
                // If meal is of type SimplifiedMealModel, display the simplified details
                AsyncImage(url: URL(string: mealLiteModel?.strMealThumb ?? ""), scale: 2) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .aspectRatio(contentMode: .fit)
                .clipShape(Rectangle(), style: FillStyle())
                VStack(alignment: .leading) {
                    Text(mealLiteModel?.strMeal ?? "Meal Name")
                        .font(.headline)
                    Spacer()
                    HStack {
                        Label("Unknown", systemImage: "person.3")
                        Spacer()
                        Label(mealLiteModel?.idMeal ?? "Meal id", systemImage: "clock")
                            .labelStyle(.titleOnly)
                    }
                    .font(.caption)
                }
                .padding(10)
            } else {
                // Handle other cases or unknown types
                Text("Invalid meal type")
            }
        }
    }
}





