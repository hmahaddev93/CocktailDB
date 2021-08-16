//
//
//  Created by Khatib Mahad H. on 7/19/21.
//

import Foundation

class DrinksViewModel {
    // MARK: - Initialization
    init(model: [Drink]? = nil) {
        if let inputModel = model {
            drinks = inputModel
        }
    }
    var drinks = [Drink]()
}

extension DrinksViewModel {
    func fetchDrinks(query: String, completion: @escaping (Result<[Drink], Error>) -> Void) {
        CocktailService().search(query: query) { [unowned self] result in
            switch result {
            case .success(let drinks):
                self.drinks = drinks
                completion(.success(drinks))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
