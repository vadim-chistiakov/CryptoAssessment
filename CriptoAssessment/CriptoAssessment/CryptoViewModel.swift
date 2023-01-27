//
//  CryptoViewModel.swift
//  CriptoAssessment
//
//  Created by Vadim Chistiakov on 27.01.2023.
//

import Foundation
import Combine

final class CryptoViewModel: ObservableObject {
    
    private enum Constants {
        static let coins = [
            "btc",
            "eth",
            "tron",
            "luna",
            "polkadot",
            "dogecoin",
            "tether",
            "stellar",
            "cardano",
            "xrp"
        ]
    }
    
    @Published var currencies: [Currency] = []
    
    private let apiService: APIService
    private var cancellable: AnyCancellable?
    
    init(apiService: APIService) {
        self.apiService = apiService
        loadDataFromAPI()
    }

    func loadDataFromAPI() {
        cancellable = apiService.loadCurrencies(names: Constants.coins)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: { currencies in
                self.currencies = currencies
            })
    }
    
    func updateData(newData: [Currency]) {
        self.currencies = newData
    }
}
