//
//  ProfileViewController.swift
//  PetCard
//
//  Created by Алексей on 31.10.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setNavController()
    }
}

extension ProfileViewController {
    private func setNavController() {
        title = "Profile"
        
        let navBarItem = createNavBarItem()
        navigationItem.rightBarButtonItem = navBarItem
    }
}



// MARK: - Create custom NavigationBarItem

extension ProfileViewController {
    private func createNavBarItem() -> UIBarButtonItem {
        let notifImage = UIImage(
            systemName: "bell.fill"
        )
        
        let navBarItem = UIBarButtonItem(
            image: notifImage,
            style: .plain,
            target: self,
            action: #selector(presentNotifications)
        )
        
        return navBarItem
    }
}

// MARK: - @Objc Methods for BarButtonItem

extension ProfileViewController {
    @objc func presentNotifications() {
        let notificationVC = NotificationListViewController()
        navigationController?
            .pushViewController(notificationVC, animated: true)
    }
}
