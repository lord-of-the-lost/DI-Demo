//
//  AppDelegate.swift
//  DI-Demo
//
//  Created by Николай Игнатов on 28.03.2025.
//

import UIKit

// MARK: - Demo #1
@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let service = Service()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        viewController.service = service
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

// MARK: - Demo #5
//@main
//final class AppDelegate: UIResponder, UIApplicationDelegate {
//    var window: UIWindow?
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let viewController = ViewController(
//            service: Service(),
//            loggingService: LoggingService(),
//            networkService: NetworkService(),
//            analyticsService: AnalyticsService()
//        )
//        window?.rootViewController = viewController
//        window?.makeKeyAndVisible()
//        
//        return true
//    }
//}

// MARK: - Demo #6
//@main
//final class AppDelegate: UIResponder, UIApplicationDelegate {
//    var window: UIWindow?
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        registerServices()
//        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let viewController = ViewController()
//        window?.rootViewController = viewController
//        window?.makeKeyAndVisible()
//        
//        return true
//    }
//    
//    private func registerServices() {
//        let loggingService = LoggingService()
//        ServiceLocator.shared.register(service: loggingService) // Сначала регистрируем LoggingService
//        ServiceLocator.shared.register(service: Service(loggingService: loggingService)) // Затем регистрируем Service
//        ServiceLocator.shared.register(service: NetworkService())
//        ServiceLocator.shared.register(service: AnalyticsService())
//    }
//}

// MARK: - Demo #7
//@main
//final class AppDelegate: UIResponder, UIApplicationDelegate {
//    var window: UIWindow?
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let appComponent = AppComponent()
//        let viewController = ViewController(dependency: appComponent)
//        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = viewController
//        window?.makeKeyAndVisible()
//        
//        return true
//    }
//}
