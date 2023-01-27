//
//  ApiService.swift
//  CriptoAssessment
//
//  Created by Vadim Chistiakov on 27.01.2023.
//

import Foundation
import Combine

//TODO: Warning: - add error handling
//{"status":{"elapsed":2,"timestamp":"2023-01-27T19:04:19.607643892Z","error_code":429,"error_message":"Rate limit exceeded, retry in 26 seconds. To increase the limit, create an account on messari.io."}}

protocol APIService {
    func loadCurrency(name: String) -> AnyPublisher<Currency, Error>
    func loadCurrencies(names: [String]) -> AnyPublisher<[Currency], Error>
}

final class APIServiceImpl: APIService {
    
    private enum Constants {
        static let baseUrl = "https://data.messari.io/api/v1/assets/"
        static let endpoint = "/metrics"
    }
    
    func loadCurrency(name: String) -> AnyPublisher<Currency, Error> {
        let url = configureURL(for: name)
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Currency.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func loadCurrencies(names: [String]) -> AnyPublisher<[Currency], Error> {
        names.map { name in
            loadCurrency(name: name)
        }
        .publisher
        .flatMap { $0 }
        .collect()
        .eraseToAnyPublisher()

    }

    
    //MARK: - Private methods
    
    private func configureURL(for name: String) -> URL {
        URL(string: Constants.baseUrl + name + Constants.endpoint)!
    }
}
