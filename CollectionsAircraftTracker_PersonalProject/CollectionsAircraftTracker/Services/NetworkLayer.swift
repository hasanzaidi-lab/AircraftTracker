//
//  NetworkLayer.swift
//  CollectionsAircraftTracker
//
//  Created by Hasan Zaidi on 5/9/25.
//

import Foundation

enum NetworkError: Error {
    case urlRequestFailed
    case decodingFailed(Error) // capture underlying error
}

class NetworkLayer {
    func doApiCall<T: Decodable>(urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.urlRequestFailed
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase // optional: if server uses snake_case
            
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            print("❌ Decoding failed with error: \(error)")
            throw NetworkError.decodingFailed(error)
        }
    }
}
