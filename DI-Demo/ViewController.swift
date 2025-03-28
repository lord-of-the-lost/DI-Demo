//
//  ViewController.swift
//  DI-Demo
//
//  Created by Николай Игнатов on 28.03.2025.
//

import UIKit

// MARK: - #1 Property injection
final class ViewController: UIViewController {
    var service: Service? // Зависимость через свойство
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service?.doSomething()
    }
}

final class Service {
    private var isWorkingNow = false
    
    func doSomething() {
        guard !isWorkingNow else { return }
        isWorkingNow.toggle()
        
        print("start work")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            print("end work")
            self.isWorkingNow.toggle()
        }
    }
}

// MARK: - #2 Method injection
//final class ViewController: UIViewController {
//    func configure(with service: Service) { // Зависимость через метод
//        service.doSomething()
//    }
//}
//
//final class Service {
//    private var isWorkingNow = false
//    
//    func doSomething() {
//        guard !isWorkingNow else { return }
//        isWorkingNow.toggle()
//        
//        print("start work")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            print("end work")
//            self.isWorkingNow.toggle()
//        }
//    }
//}

// MARK: - #3 Init injection
//final class ViewController: UIViewController {
//    private let service: Service // Зависимость через инициализатор
//    
//    init(service: Service) {
//        self.service = service
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        service.doSomething()
//    }
//}
//
//final class Service {
//    private var isWorkingNow = false
//
//    func doSomething() {
//        guard !isWorkingNow else { return }
//        isWorkingNow.toggle()
//
//        print("start work")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            print("end work")
//            self.isWorkingNow.toggle()
//        }
//    }
//}

// MARK: - #4 DI in MVP
//final class UserPresenter {
//    private weak var view: UserViewController?
//    
//    func setupView(_ view: UserViewController) {
//        self.view = view
//    }
//    
//    func loadUsers() {
//        let users = ["Alice", "Bob", "Charlie"]
//        view?.displayUsers(users)
//    }
//}
//
//final class UserViewController: UIViewController {
//    private let presenter: UserPresenter
//    
//    init(presenter: UserPresenter) {
//        self.presenter = presenter
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        presenter.setupView(self)
//        presenter.loadUsers()
//    }
//    
//    func displayUsers(_ users: [String]) {
//        print("Users: \(users)")
//    }
//}
//
///// Глобальный метод имитирующий фабрику для сборки модуля и примера DI
//func crateUserModule() -> UserViewController {
//    let presenter = UserPresenter()
//    let controller = UserViewController(presenter: presenter)
//    presenter.setupView(controller)
//    return controller
//}
//


// MARK: - #5 Init injection issue
//final class ViewController: UIViewController {
//    private let service: Service
//    private let loggingService: LoggingService
//    private let networkService: NetworkService
//    private let analyticsService: AnalyticsService
//    
//    init(service: Service, loggingService: LoggingService, networkService: NetworkService, analyticsService: AnalyticsService) {
//        self.service = service
//        self.loggingService = loggingService
//        self.networkService = networkService
//        self.analyticsService = analyticsService
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        service.doSomething()
//        loggingService.log(message: "View did load")
//        networkService.fetchData()
//        analyticsService.trackEvent(event: "View Loaded")
//    }
//}
//
//// MARK: - Моковые сервисы
//final class Service {
//    private var isWorkingNow = false
//    
//    func doSomething() {
//        guard !isWorkingNow else { return }
//        isWorkingNow.toggle()
//        
//        print("start work")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            print("end work")
//            self.isWorkingNow.toggle()
//        }
//    }
//}
//
//
//final class LoggingService {
//    func log(message: String) {
//        print("Log: \(message)")
//    }
//}
//
//final class NetworkService {
//    func fetchData() {
//        print("Fetching data...")
//    }
//}
//
//final class AnalyticsService {
//    func trackEvent(event: String) {
//        print("Tracking event: \(event)")
//    }
//}
//

// MARK: - #6 ServiceLocator for DI
//final class ServiceLocator {
//    static let shared = ServiceLocator()
//    private var services: [String: Any] = [:]
//    
//    private init() {}
//    
//    func register<T>(service: T) {
//        let key = String(describing: T.self)
//        services[key] = service
//    }
//    
//    func resolve<T>() -> T? {
//        let key = String(describing: T.self)
//        return services[key] as? T
//    }
//}
//
//final class ViewController: UIViewController {
//    private let service: Service
//    private let loggingService: LoggingService
//    private let networkService: NetworkService
//    private let analyticsService: AnalyticsService
//    
//    init() {
//        // Получаем зависимости из сервис-локатора
//        guard
//            let service: Service = ServiceLocator.shared.resolve(),
//            let loggingService: LoggingService = ServiceLocator.shared.resolve(),
//            let networkService: NetworkService = ServiceLocator.shared.resolve(),
//            let analyticsService: AnalyticsService = ServiceLocator.shared.resolve()
//        else {
//            fatalError("Failed to resolve dependencies")
//        }
//        
//        self.service = service
//        self.loggingService = loggingService
//        self.networkService = networkService
//        self.analyticsService = analyticsService
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        service.doSomething()
//        loggingService.log(message: "View did load")
//        networkService.fetchData()
//        analyticsService.trackEvent(event: "View Loaded")
//    }
//}
//
//// MARK: - Моковые сервисы
//final class Service {
//    private var isWorkingNow = false
//    private let loggingService: LoggingService
//    
//    init(loggingService: LoggingService) {
//        self.loggingService = loggingService
//    }
//    
//    func doSomething() {
//        guard !isWorkingNow else { return }
//        isWorkingNow.toggle()
//        
//        loggingService.log(message:"start work")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.loggingService.log(message:"end work")
//            self.isWorkingNow.toggle()
//        }
//    }
//}
//
//
//final class LoggingService {
//    func log(message: String) {
//        print("Log: \(message)")
//    }
//}
//
//final class NetworkService {
//    func fetchData() {
//        print("Fetching data...")
//    }
//}
//
//final class AnalyticsService {
//    func trackEvent(event: String) {
//        print("Tracking event: \(event)")
//    }
//}
//

// MARK: - #7 AppComponent for DI
//final class AppComponent {
//    lazy var loggingService: LoggingService = LoggingService()
//    lazy var service: Service = Service(loggingService: loggingService)
//    lazy var networkService: NetworkService = NetworkService()
//    lazy var analyticsService: AnalyticsService = AnalyticsService()
//}
//
//final class ViewController: UIViewController {
//    private let service: Service
//    private let loggingService: LoggingService
//    private let networkService: NetworkService
//    private let analyticsService: AnalyticsService
//    
//    init(dependency: AppComponent) {
//        self.service = dependency.service
//        self.loggingService = dependency.loggingService
//        self.networkService = dependency.networkService
//        self.analyticsService = dependency.analyticsService
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        service.doSomething()
//        loggingService.log(message: "View did load")
//        networkService.fetchData()
//        analyticsService.trackEvent(event: "View Loaded")
//    }
//}
//
//final class Service {
//    private var isWorkingNow = false
//    private let loggingService: LoggingService
//    
//    init(loggingService: LoggingService) {
//        self.loggingService = loggingService
//    }
//    
//    func doSomething() {
//        guard !isWorkingNow else { return }
//        isWorkingNow.toggle()
//        
//        loggingService.log(message:"start work")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.loggingService.log(message:"end work")
//            self.isWorkingNow.toggle()
//        }
//    }
//}
//
//final class LoggingService {
//    func log(message: String) {
//        print("Log: \(message)")
//    }
//}
//
//final class NetworkService {
//    func fetchData() {
//        print("Fetching data...")
//    }
//}
//
//final class AnalyticsService {
//    func trackEvent(event: String) {
//        print("Tracking event: \(event)")
//    }
//}
//
