//
//  ContentView.swift
//  PlateJoy
//
//  Created by Hanasrullah Halim on 30/04/2024.
//

import SwiftUI

struct ListOfMealView: View {
    
    @State private var meal: MealModel?
    @State private var mealList: [MealModel]?
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    
    var body: some View {
        NavigationView{
            
            
                List(mealList ?? [], id: \.self){m in
                        CardView(meal:m)
                }
            
        }.navigationTitle("Plate of Joy").task {
            do{
                mealList = try await performAPICall()
            }
            catch {
                print("Unexpected Error")
            }
        }
        
        
    }
    func performAPICall() async throws -> [MealModel]? {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=b") else{
            throw PlateJoyError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw PlateJoyError.invalidResponse
        }
        do{
            let mealResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
            return mealResponse.meals
        }catch{
            throw PlateJoyError.invalidData
        }
        
    }
    
    
}



#Preview {
    ListOfMealView()
}
