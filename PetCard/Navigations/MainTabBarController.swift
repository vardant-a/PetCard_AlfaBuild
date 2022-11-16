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
        
        createTabBar()
        settingTabBar()
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
        tabBarAppearance.backgroundColor = .barColor
        tabBarAppearance.unselectedItemTintColor = .systemGray
        tabBarAppearance.tintColor = .systemBlue
    }
}
// MARK: - Create collections VC for TabBar
extension MainTabBarController {
    private func createTabBar() {
        let homeVC = createVC(
            HomeViewController(),
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
        
//        let mapVC = createVC(
//            MapViewController(),
//            title: "Animal Map",
//            unselectedItemImage: setItem(oldImage: "globe", newImage: "globe.europe.africa"),
//            selectedImage: setItem(oldImage: "globe", newImage: "globe.europe.africa.fill")
//        )
        
        let mapVC = MapViewController()
        mapVC.tabBarItem = UITabBarItem(
            title: "Animal Map",
            image: UIImage(
                systemName: setItem(
                    oldImage: "globe",
                    newImage: "globe.europe.africa")
            ),
            selectedImage: UIImage(
                systemName: setItem(
                    oldImage: "globe",
                    newImage: "globe.europe.africa.fill")
            )
        )
        
        let settingsVC = createVC(
            ProfileViewController(),
            title: "Profile",
            unselectedItemImage: "person",
            selectedImage: "person.fill"
        )
        
        viewControllers = [homeVC, calendarVC, mapVC, settingsVC]
    }
    
    private func setItem(oldImage forOldVersionIOS: String, newImage forNewVersionIOS: String) -> String {
        if #available(iOS 15.0, *) {
            return forNewVersionIOS
        } else {
            return forOldVersionIOS
        }
    }
}
