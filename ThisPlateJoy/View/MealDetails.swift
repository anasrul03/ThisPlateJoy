//
//  MealDetails.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 20/05/2024.
//

import Foundation
import SwiftUI

struct MealDetailView: View {
    
    @State private var showNavigationBar = false
    
    let meal: MealModel
    
    var body: some View {
        
        
        VStack(alignment:.leading){
            AsyncImage(url: URL(string: meal.strMealThumb ?? ""), scale: 2) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }   .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
            VStack{
                Text(meal.strMeal).font(.system(size: 30)).fontWeight(.bold).padding(20)
                Text(meal.strInstructions ?? "Instruction is not included").font(.subheadline)
                
                HStack{
                    
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Text("Get Recipe")
                            .foregroundColor(.white)
                            .padding()
                            .cornerRadius(12)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }  .padding([.horizontal, .vertical], 10)
            
        }.navigationTitle(meal.strMeal).navigationBarTitleDisplayMode(.inline).toolbar(showNavigationBar ? .visible : .hidden, for: .tabBar).onDisappear(perform: {
            
            showNavigationBar.toggle()
            
        })
        
        
        
        
    }
}

#Preview {
    
    MealDetailView( meal: MealModel.randomMeal)
    
}
