//
//  main.swift
//  Delegate_example
//
//  Created by Nurlan Seitov on 24/7/23.
//

//Пример 1: Простой пример делегирования для передачи данных обратно из дочернего представления в родительское:

import Foundation

//protocol DataDelegate: AnyObject {
//    func dataUpdated(data: String)
//}
//
//class ChildViewController {
//    weak var delegate: DataDelegate?
//
//    // Некоторый код, который обновляет данные и вызывает делегат при обновлении
//    func updateData() {
//        let newData = "Новые данные"
//        delegate?.dataUpdated(data: newData)
//    }
//}
//
//class ParentViewController: DataDelegate {
//    func dataUpdated(data: String) {
//        print("Данные были обновлены: \(data)")
//    }
//
//    // Создание и настройка дочернего представления
//    func setupChildViewController() {
//        let childVC = ChildViewController()
//        childVC.delegate = self
//        // Добавьте дочернее представление в родительское представление
//
//        childVC.updateData() // Вызов метода для обновления данных
//    }
//}
//
//let parentVC = ParentViewController()
//parentVC.setupChildViewController()

//РЕЗУЛЬТАТ: Данные были обновлены: Новые данные

//Пример 2: Простой пример делегирования для определения, может ли объект выполнить определенное действие:

//protocol AuthorizationDelegate: AnyObject {
//    func canAuthorize() -> Bool
//}
//
//class UserManager {
//    weak var authorizationDelegate: AuthorizationDelegate?
//
//    func performActionIfAuthorized() {
//        if authorizationDelegate?.canAuthorize() == true {
//            print("Действие выполнено, так как авторизация прошла успешно.")
//        } else {
//            print("Действие не выполнено, так как авторизация не была пройдена.")
//        }
//    }
//}
//
//class AuthorizationManager: AuthorizationDelegate {
//    func canAuthorize() -> Bool {
//        // Некоторая логика для проверки авторизации
//        let isAuthorized = true // Здесь может быть проверка авторизации на основе данных пользователя
//        return isAuthorized
//    }
//
//    // Создание и настройка объекта UserManager
//    func setupUserManager() {
//        let userManager = UserManager()
//        userManager.authorizationDelegate = self // Установка делегата
//        // Используйте userManager для выполнения действий, требующих авторизации
//        userManager.performActionIfAuthorized() // Вызов метода для выполнения действия
//
//    }
//}
//
//let authManager = AuthorizationManager()
//authManager.setupUserManager()

//РЕЗУЛЬТАТ: Действие выполнено, так как авторизация прошла успешно.

//Пример 3: Простой пример делегирования для уведомления об изменениях состояния:

protocol StateDelegate: AnyObject {
    func stateChanged(newState: String)
}

class StateManager {
    weak var stateDelegate: StateDelegate?
    
    var currentState: String = "" {
        didSet {
            stateDelegate?.stateChanged(newState: currentState)
        }
    }
}

class Observer: StateDelegate {
    func stateChanged(newState: String) {
        print("Состояние изменилось: \(newState)")
    }
    
    // Создание и настройка объекта StateManager
    func setupStateManager() {
        let stateManager = StateManager()
        stateManager.stateDelegate = self // Установка делегата
        stateManager.currentState = "Новое состояние" // Изменение состояния, что приведет к вызову делегата
    }
}

let observer = Observer()
observer.setupStateManager()

//РЕЗУЛЬТАТ: Состояние изменилось: Новое состояние
