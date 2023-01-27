//
//  LoginViewModel.swift
//  CriptoTestAssissment
//
//  Created by Vadim Chistiakov on 16.01.2023.
//

import Foundation

let authKey = "isLogin"

protocol LoginViewModel {
    func didTapNextButton(login: String, password: String)
}

//final class SingInViewModel: LoginViewModel {
//    
//}
// - бизнес логика
// обработка всей логике
// хранит данные
final class LoginViewModelImpl: LoginViewModel {
    
    private let router: LoginRouter
    private let userDefaults: UserDefaults
    
    init(router: LoginRouter) {
        self.router = router
        self.userDefaults = UserDefaults.standard
    }
    
    func didTapNextButton(login: String, password: String) {
        if login == "1234" && password == "1234" {
            router.routeToCoinsScreen()
            userDefaults.set(true, forKey: authKey)
        } else {
            // например показать алерт
            print("Error!!!")
        }
        // - переходим на другой экран списка монет
    }
        
    func logout() {
        userDefaults.set(false, forKey: authKey)
    }
}
