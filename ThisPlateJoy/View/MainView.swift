//
//  MainView.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 12/05/2024.
//

import Foundation
import SwiftUI
struct MainView: View{
    var body: some View{
        TabView{
            ListOfMealView(listType:   FilterTypeEnum.firstLetter, endpoint: "h").tabItem { Label("Home" ,systemImage: "circle.grid.3x3")}
            ListOfMealView(listType: FilterTypeEnum.categories, endpoint: "Seafood").tabItem { Label("Categories" ,systemImage: "tray")}
            ListOfMealView(listType:  FilterTypeEnum.area, endpoint: "Canadian").tabItem { Label("Area" ,systemImage: "location")}
            ListOfMealView(listType: FilterTypeEnum.random, endpoint: nil).tabItem { Label("Setting" ,systemImage: "gear")}
            
        }
    }
}
#Preview {
    MainView()
}
