//
//  AppDelegate.swift
//  CriptoTestAssissment
//
//  Created by Vadim Chistiakov on 16.01.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var loginRouter: LoginRouter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Создаем виндоу
        window = UIWindow(frame: UIScreen.main.bounds)

        // создаем самый первый навигейшн контроллер
        let navigationController = UINavigationController()
        
        // присваем основной навигейшен контролер у виндоу
        window?.rootViewController = navigationController
        
        // вызов системного метода
        window?.makeKeyAndVisible()
        
        // создаем роутер и передаем нав котроллер
        loginRouter = LoginRouterImpl(navigationController: navigationController)
        
        // настраиваем запуск
        let isLogin = UserDefaults.standard.bool(forKey: authKey)
        
        if isLogin {
            // показываем монеты
            loginRouter?.routeToCoinsScreen()
        } else {
            // показ экрана логина
            loginRouter?.routeToLogin()
        }
        
        return true
    }


}

