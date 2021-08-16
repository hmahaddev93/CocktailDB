//
//
//  Created by Khatib Mahad H. on 7/19/21.
//

import Foundation
import UIKit

class DrinkDetailViewModel {
    var drink: Drink
    var ingredients = [DrinkIngredient]()
    
    init(drink: Drink) {
        self.drink = drink
        ingredients = drink.getIngredientList()
    }
}

extension DrinkDetailViewModel {
    func getInstructionsCellHeight() -> CGFloat {
        let height = drink.instructions.heightWithConstrainedWidth(width: UIScreen.main.bounds.width - 48 , font: UIFont.systemFont(ofSize: 14))
        if height < 28 {
            return 44
        }
        return height + 30
    }
    
    func ingredientDescriptionForIndex(idx: Int) -> NSAttributedString {
        let ingredient = ingredients[idx]
        let attributedName = NSMutableAttributedString(string:ingredient.name)

        if let measure = ingredient.measure {
            let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
            let boldMeasure = NSMutableAttributedString(string: measure + " ", attributes:attrs)
            boldMeasure.append(attributedName)
            
            return boldMeasure
        }
        return attributedName
    }
}
