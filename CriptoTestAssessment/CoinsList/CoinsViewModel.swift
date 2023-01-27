//
//  CoinsViewModel.swift
//  CriptoTestAssissment
//
//  Created by Vadim Chistiakov on 16.01.2023.
//

import Foundation

struct CoinModel: Decodable {
    
    struct Coin: Decodable {
        let name: String
        let symbol: String
    }
    
    let data: Coin
}

class CoinsViewModel {
    
    private let dispatchGroup = DispatchGroup()
    private let queue = DispatchQueue(label: "coins", attributes: .concurrent)
    
    private let router: LoginRouter
    private let network: NetworkClient
    
    var answers: [CoinModel] = []
    
    init(
        router: LoginRouter,
        network: NetworkClient
    ) {
        self.router = router
        self.network = network
    }

    
    func loadCoins(completion: @escaping () -> Void) {
        let coins = ["btc", "eth"] //, tron, luna, polkadot, dogecoin, tether, stellar, cardano, xrp]
        
        // стартуем спиннер
        queue.async(group: dispatchGroup) { [weak self] in
            coins.forEach { coin in
                let stringURL = "https://data.messari.io/api/v1/assets/\(coin)/metrics"
                
                self?.network.loadCoins(stringUrl: stringURL) { [weak self] result in
                    switch result {
                    case .success(let model):
                        self?.answers.append(model)
                    case .failure:
                        break
                    }
                    // обрабатываем ответ
                    
                    //выходим из группы
                    self?.dispatchGroup.leave()
                }
                //заходим
                self?.dispatchGroup.enter()
            }
        }
        
        queue.async(group: dispatchGroup) { [weak self] in
            self?.dispatchGroup.notify(queue: .main) {
                //останавливаем спиннер
                // вызвать событие, которое обновит твою таблицу
                completion()
            }
        }
    }
    
    func routeToCoinsDetails() {
        router.routeToCoinsDetails()
    }
    
    func logout() {
        router.routeToLogin()
    }
        
    private func loadCoin(coinName: String, completion: (Result<CoinModel, Error>) -> Void) {
        // dataTask
        
        //ответ
//        completion(Result.success(<#T##_#>) .success(CoinModel()))
    }
    
    
}
