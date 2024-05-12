//
//  CardView.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 05/05/2024.
//

import Foundation
import SwiftUI


struct CardView: View {
    let meal: MealModel?
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal?.strMealThumb ?? ""), scale: 2){
                image in image.resizable()
            }placeholder: {
    
                ProgressView()

                }
            .frame(width: 80, height: 80).aspectRatio(contentMode: .fit).clipShape(.rect(cornerRadius: 15),style: FillStyle())
            VStack(alignment: .leading) {
                Text(meal?.strMeal ?? "Meal Name")
                    .font(.headline)
                Spacer()
                HStack {
                    Label(meal?.strArea ?? "Meal Area", systemImage: "person.3")
                    Spacer()
                    Label(meal?.idMeal ?? "Meal id", systemImage: "clock")
                        .labelStyle(.titleOnly)
                }
                .font(.caption)
            }
            .padding(10)
        }
    }
}




