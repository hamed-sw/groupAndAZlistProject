//
//  JsonParsing.swift
//  groupAndAZlist
//
//  Created by Hamed Amiry on 26.11.2021.
//

import UIKit

class JsonParsing {
    
    static func apiCall(completion: @escaping (Result<[NasaData],Error>)->Void) {
        if let url = URL(string: String.APIs.nasaAPI) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return}
                do {
                    let json = try JSONDecoder().decode([NasaData].self, from: data)
                    completion(.success(json))
                }catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
        
    }
}
