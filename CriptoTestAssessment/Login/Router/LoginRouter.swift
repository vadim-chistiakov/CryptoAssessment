//
//  LoginRouter.swift
//  CriptoTestAssissment
//
//  Created by Vadim Chistiakov on 16.01.2023.
//

import UIKit

protocol LoginRouter {
    func routeToLogin()
    func routeToCoinsScreen()
    func routeToCoinsDetails()
    func popViewController()
}

final class LoginRouterImpl: LoginRouter {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeToLogin() {
        let viewModel = LoginViewModelImpl(router: self)
        let vc = LoginViewController(viewModel: viewModel)
        navigationController?.viewControllers = [vc]
    }
    
    func routeToCoinsScreen() {
        let viewModel = CoinsViewModel(router: self, network: NetworkClient())
        let coinsVC = CoinsViewController(viewModel: viewModel)
        
        // заменит стек вью контролера на новый
        navigationController?.viewControllers = [coinsVC]
    }
    
    func routeToCoinsDetails() {
        
    }
    
    func popViewController() {
        
    }
}
