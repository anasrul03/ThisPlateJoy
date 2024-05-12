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


struct CardView_Previews: PreviewProvider {
    static var meal =        MealModel(idMeal: UUID().uuidString, name: "Chinese Fried Rice", mealThumbnail: "https://www.unileverfoodsolutions.com.my/dam/ufs-my/Unilevel-020720207313.jpg", youtubeLink: "", sourceLink: "", instruction: """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
""", area: "")
    static var previews: some View {
        CardView(meal: meal)
            .background(.gray)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}

#Preview {
    CardView(meal:        MealModel(idMeal: UUID().uuidString, name: "Chinese Fried Rice", mealThumbnail: "https://www.unileverfoodsolutions.com.my/dam/ufs-my/Unilevel-020720207313.jpg", youtubeLink: "", sourceLink: "", instruction: """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
""", area: ""))
}
