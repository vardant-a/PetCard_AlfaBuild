//
//  ProfileViewController.swift
//  PetCard
//
//  Created by Алексей on 31.10.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Private lazy properties
    
    private lazy var logOutButton = UIButton.createSystemButton(self,
            withTitle: "Log Out",
            andColor: .systemRed,
            action: UIAction { _ in
                print("Log Out")
            },
            objcAction: #selector(logOutTest)
        )
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavController()
        view.backgroundColor = .systemBackground
        view.addSubview(logOutButton)
        setConstrains()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - @Objc methods
    @objc func logOutTest() {
        print("Log Out")
    }
}
    // MARK: - Setting NavigationController
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
//        let notificationVC = NotificationListViewController()
//        navigationController?
//            .pushViewController(notificationVC, animated: true)
    }
}
    // MARK: - Constrains setting
extension ProfileViewController {
    private func setConstrains() {
        // constrains logOutButton
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            logOutButton.heightAnchor.constraint(equalToConstant: 44),
            logOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
        ])
    }
}
