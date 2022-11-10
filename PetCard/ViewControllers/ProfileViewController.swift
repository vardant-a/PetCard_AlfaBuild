//
//  ProfileViewController.swift
//  PetCard
//
//  Created by Алексей on 31.10.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Private lazy properties
    
    private lazy var logOutButton = UIButton.createButton(
            withTitle: "LogOut",
            andColor: .systemRed,
            action: UIAction { _ in
                print("LogOut")
            }
        )
        
    private lazy var versionAppLabel: UILabel = {
        let label = UILabel()
        // Determining the Application Version
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        label.text = "Application version - \(appVersion ?? "xxx")"
        label.textColor = UIColor.systemGray
        return label
    }()
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavController()
        view.backgroundColor = .systemBackground
        view.addSubview(versionAppLabel)
        view.addSubview(logOutButton)
        setConstrains()
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
        let notificationVC = NotificationListViewController()
        navigationController?
            .pushViewController(notificationVC, animated: true)
    }
}
    // MARK: - Constrains setting
extension ProfileViewController {
    private func setConstrains() {
        // constrains logOutButton
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logOutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
            logOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16)
        ])
        
        // constrains versionAppLabel
        versionAppLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            versionAppLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            versionAppLabel.topAnchor.constraint(equalTo: logOutButton.bottomAnchor)
        ])
    }
}
