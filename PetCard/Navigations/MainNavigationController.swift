//
//  MainNavigationController.swift
//  PetCard
//
//  Created by Алексей on 02.11.2022.
//

import UIKit

final class MainNavigationController: UINavigationController {

    private var osTheme: UIUserInterfaceStyle {
        return UIScreen.main.traitCollection.userInterfaceStyle
    }
    
    override internal var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle(rawValue: (topViewController?.preferredStatusBarStyle)!.rawValue) ?? .default
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .navColor
        
//        appearance.titleTextAttributes = [
//            .foregroundColor: УСЛОВИЕ
//            ? UIColor.blue
//            : UIColor.black
//        ]

//        appearance.largeTitleTextAttributes = [
//            .foregroundColor: УСЛОВИЕ
//            ? UIColor.green
//            : UIColor.black
//        ]

        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.prefersLargeTitles = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - NavigationBar settings throughout the app
// Second method
extension MainNavigationController {
    private func settingNavBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .white
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().prefersLargeTitles = true
    }
}
