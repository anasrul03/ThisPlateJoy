

import Foundation


struct MealsResponse: Codable {
    let meals: [MealModel]
}
struct MealsLiteResponse: Codable {
    let meals: [MealLiteModel]
}

struct MealModel: Codable, Hashable{
    
    var idMeal: String
    var strMeal: String
    var strMealThumb: String?
    var strYoutube: String?
    var strSource: String?
    var strInstructions: String?
    var strArea: String?
    
    
    init(idMeal: String, name: String, mealThumbnail: String, youtubeLink: String, sourceLink: String, instruction: String, area: String) {
        
        
        self.idMeal = idMeal
        self.strMeal = name
        self.strMealThumb = mealThumbnail
        self.strYoutube = youtubeLink
        self.strSource = sourceLink
        self.strInstructions = instruction
        self.strArea = area
        
        
    }
    
    
}

struct MealLiteModel: Codable, Hashable{
    
    var idMeal: String
    var strMeal: String
    var strMealThumb: String?
    
    
    
    init(idMeal: String, name: String, mealThumbnail: String) {
        
        
        self.idMeal = idMeal
        self.strMeal = name
        self.strMealThumb = mealThumbnail
        
        
        
    }
    
    
}
