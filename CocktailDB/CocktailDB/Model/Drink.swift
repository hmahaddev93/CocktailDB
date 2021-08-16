//
//  
//
//  Created by Khatib Mahad H. on 8/11/21.
//

import Foundation
import CoreData

struct Drink: Codable, Identifiable {
    let id: String
    let name: String
    let tags: String?
    let category: String
    let IBA: String?
    let alcoholic: String
    let glass: String
    let instructions: String
    let thumbnailURL: URL
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let dateModified: Date?

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case tags = "strTags"
        case category = "strCategory"
        case IBA = "strIBA"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case thumbnailURL = "strDrinkThumb"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case dateModified
    }
    
    func getIngredientList() -> [DrinkIngredient] {
        var results = [DrinkIngredient]()
        if let ingredient1 = self.ingredient1 {
            results.append(DrinkIngredient(name: ingredient1, measure: self.measure1))
        }
        if let ingredient2 = self.ingredient2 {
            results.append(DrinkIngredient(name: ingredient2, measure: self.measure2))
        }
        if let ingredient3 = self.ingredient3 {
            results.append(DrinkIngredient(name: ingredient3, measure: self.measure3))
        }
        if let ingredient4 = self.ingredient4 {
            results.append(DrinkIngredient(name: ingredient4, measure: self.measure4))
        }
        if let ingredient5 = self.ingredient5 {
            results.append(DrinkIngredient(name: ingredient5, measure: self.measure5))
        }
        if let ingredient6 = self.ingredient6 {
            results.append(DrinkIngredient(name: ingredient6, measure: self.measure6))
        }
        if let ingredient7 = self.ingredient7 {
            results.append(DrinkIngredient(name: ingredient7, measure: self.measure7))
        }
        if let ingredient8 = self.ingredient8 {
            results.append(DrinkIngredient(name: ingredient8, measure: self.measure8))
        }
        if let ingredient9 = self.ingredient9 {
            results.append(DrinkIngredient(name: ingredient9, measure: self.measure9))
        }
        if let ingredient10 = self.ingredient10 {
            results.append(DrinkIngredient(name: ingredient10, measure: self.measure10))
        }
        if let ingredient11 = self.ingredient11 {
            results.append(DrinkIngredient(name: ingredient11, measure: self.measure11))
        }
        if let ingredient12 = self.ingredient12 {
            results.append(DrinkIngredient(name: ingredient12, measure: self.measure12))
        }
        if let ingredient13 = self.ingredient13 {
            results.append(DrinkIngredient(name: ingredient13, measure: self.measure13))
        }
        if let ingredient14 = self.ingredient14 {
            results.append(DrinkIngredient(name: ingredient14, measure: self.measure14))
        }
        if let ingredient15 = self.ingredient15 {
            results.append(DrinkIngredient(name: ingredient15, measure: self.measure15))
        }
        return results
    }
}

struct DrinkIngredient {
    let name: String
    let measure: String?
}
