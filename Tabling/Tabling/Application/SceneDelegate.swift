//
//  SceneDelegate.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let container = DIContainer()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewModel = container.makeListViewModel()
        let viewController = storyboard.instantiateViewController(identifier: "Main") { coder -> MainViewController? in
            return .init(coder: coder, viewModel: viewModel) ?? MainViewController(coder: coder, viewModel: viewModel)
        }
        window?.rootViewController = viewController
    }
}
