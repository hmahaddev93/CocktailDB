//
//  
//
//  Created by Khatib Mahad H. on 8/3/21.
//

import Foundation

enum CocktailDBAPI  {
    static let host: String = "www.thecocktaildb.com"
    static let dateFormat = "yyyy-MM-dd HH:mm:ss"
    enum EndPoints {
        static let search = "/api/json/v1/1/search.php"
        static let lookup = "/api/json/v1/1/lookup.php"
    }
}

struct CocktailResponseBody: Codable {
    let drinks: [Drink]
}

protocol CocktailService_Protocol {
    func search(query: String, completion: @escaping (Result<[Drink], Error>) -> Void)
}

class CocktailService: CocktailService_Protocol {
    
    private let httpManager: HTTPManager
    private let jsonDecoder: JSONDecoder
    
    enum CocktailServiceError: Error {
        case invalidURL
    }
    
    init(httpManager: HTTPManager = HTTPManager.shared) {
        self.httpManager = httpManager
        self.jsonDecoder = JSONDecoder()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = CocktailDBAPI.dateFormat
        self.jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
    }
    
    func search(query: String, completion: @escaping (Result<[Drink], Error>) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = CocktailDBAPI.host
        urlComponents.path = CocktailDBAPI.EndPoints.search

        let queryItemQuery = URLQueryItem(name: "s", value: query)
        urlComponents.queryItems = [queryItemQuery]
        
        guard let url = urlComponents.url else {
            completion(.failure(CocktailServiceError.invalidURL))
            return
        }
        
        httpManager.get(url: url) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            case .success(let data):
                completion(Result(catching: { try self.jsonDecoder.decode(CocktailResponseBody.self, from: data).drinks}))
            }
        }
    }
    
}

