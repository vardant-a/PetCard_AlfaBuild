//
//  MainTabBarController.swift
//  PetCard
//
//  Created by Алексей on 21.10.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        settingTabBar()
        
        let homeVC = createVC(
            MainViewController(),
            title: "Home",
            unselectedItemImage: "house",
            selectedImage: "house.fill"
        )
        
        let calendarVC = createVC(
            CalendarViewController(),
            title: "Calendar",
            unselectedItemImage: "calendar",
            selectedImage: "calendar.badge.clock"
        )
        
        let mapVC = createVC(
            MapViewController(),
            title: "Animal Map",
            unselectedItemImage: "globe.asia.australia",
            selectedImage: "globe.asia.australia.fill"
        )
        
        let settingsVC = createVC(
            SettingsViewController(),
            title: "Settings",
            unselectedItemImage: "gear",
            selectedImage: "gearshape.fill"
        )
        
        self.viewControllers = [homeVC, calendarVC, mapVC, settingsVC]
    }
    
}

// MARK: - Create VC and TabBarItem
extension MainTabBarController {
    private func createVC(_ viewController: UIViewController, title: String, unselectedItemImage: String, selectedImage: String) -> UINavigationController {
        let viewContoller = MainNavigationController(rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: unselectedItemImage),
            selectedImage: UIImage(systemName: selectedImage)
        )
        return viewContoller
    }
}

// MARK: - TabBarController settings throughout the app
extension MainTabBarController {
    private func settingTabBar() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = .navColor
        tabBarAppearance.unselectedItemTintColor = .systemGray
        tabBarAppearance.tintColor = .systemBlue
    }
}
