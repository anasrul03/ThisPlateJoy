//
//  ContentView.swift
//  PlateJoy
//
//  Created by Hanasrullah Halim on 30/04/2024.
//

import SwiftUI

struct ListOfMealView: View {
    
    @State private var mealList: [MealModel]?
    @State private var mealLiteList: [MealLiteModel]?
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    let listType: FilterTypeEnum?
    let endpoint: String?
    
    var body: some View {
        NavigationView{
            
            
            List(mealList ?? [], id: \.self){m in
                CardView(meal:m)
            }.navigationTitle("Plate of Joy").navigationBarItems(trailing: Image(systemName: "star")).task {
                do{
                    if listType != FilterTypeEnum.firstLetter{
                        mealLiteList = try await performLiteAPICall(filterType: listType, endpoint: endpoint) 
                    }else{
                        mealList = try await performAPICall(filterType: listType, endpoint: endpoint)
                    }
                    
                }
                catch PlateJoyError.invalidData{
                    print("Invalid Data")
                } catch PlateJoyError.invalidURL{
                    print("Invalid URL")
                } catch PlateJoyError.invalidResponse{
                    print("Invalid Response")
                }catch{
                    print("")
                }
            }
            
        }
        
        
    }
    func performAPICall(filterType: FilterTypeEnum?, endpoint: String?) async throws -> [MealModel]? {
        guard let url = URL(string: "\(getUrl(for: filterType))\(String(describing: endpoint))") else{
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
    
    func performLiteAPICall(filterType: FilterTypeEnum?, endpoint: String?) async throws -> [MealLiteModel]? {
        guard let url = URL(string: "\(getUrl(for: filterType))\(String(describing: endpoint))") else{
            throw PlateJoyError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw PlateJoyError.invalidResponse
        }
        do{
            
                let mealResponse = try JSONDecoder().decode(MealsLiteResponse.self, from: data)
                return mealResponse.meals
         
       
        }catch{
            throw PlateJoyError.invalidData
        }
        
    }
    
    func getUrl(for listType: FilterTypeEnum?)-> String{
        guard let type = listType else {
            return ""
        }
        
        switch type{
        case .area:
            return "https://www.themealdb.com/api/json/v1/1/filter.php?a="
        case .categories:
            return "https://www.themealdb.com/api/json/v1/1/filter.php?c="
        case .mainIngredient:
            return "https://www.themealdb.com/api/json/v1/1/filter.php?i="
        case .random:
            return "https://www.themealdb.com/api/json/v1/1/random.php"
        case .firstLetter:
            return "https:/www.themealdb.com/api/json/v1/1/search.php?f="
        }
    }
    
    
    
}



#Preview {
    ListOfMealView(listType: FilterTypeEnum.area, endpoint: "j")
}
