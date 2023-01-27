//
//  NetworkClient.swift
//  CriptoTestAssissment
//
//  Created by Vadim Chistiakov on 25.01.2023.
//

import UIKit

class NetworkClient {

    func loadCoins(
        stringUrl: String,
        completion: @escaping  (Result<CoinModel, Never>)  -> Void
    ) {
        URLSession.shared.dataTask(
            with: URL(string: stringUrl)!) { data, response, error in
                guard let data,
                      let model = try? JSONDecoder().decode(CoinModel.self, from: data)
                else { return }
                completion(.success(model))
            }.resume()
    }
}
