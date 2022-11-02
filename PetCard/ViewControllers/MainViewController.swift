//
//  ViewController.swift
//  PetCard
//
//  Created by Алексей on 21.10.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var conditionNotification = true
    
    private lazy var switchNotifButton = createButton(
        withTitle: "Switch Notification",
        andColor: .systemBlue,
        action: UIAction {  _ in
            self.conditionNotification.toggle()
            print(self.conditionNotification)
        }
    )
    //    : UIButton = {
    //        let button = UIButton()
    //        button.backgroundColor = .systemBlue
    //        button.setTitle("Switch Notification", for: .normal)
    //        return button
    //    }()
    
    private lazy var testButton = createButton(
        withTitle: "test",
        andColor: .black,
        action: UIAction { _ in print("1") }
    )
    
    
    
    // MARK: - Ovveride Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setNavController()
        setSwitchButton()
    }
    

}

// MARK: - @Objc Methods for BarButtonItem

extension MainViewController {
    @objc func presentNotifications() {
        if conditionNotification {
            let notificationVC = NotificationListViewController()
            notificationVC.title = "Notifications"
            notificationVC.view.backgroundColor = .red
            navigationController?
                .pushViewController(notificationVC, animated: true)
        } else {
            print("Notifications not found")
        }
    }
}
    // MARK: - Settings NavigationController

extension MainViewController {
    private func setNavController() {
        let navBarItem = createNavBarItem()
        
        title = "Home"
        navigationItem.rightBarButtonItem = navBarItem
    }
}

    // MARK: - Setting for button switch notification

extension MainViewController {
    private func setSwitchButton() {
        view.addSubview(switchNotifButton)
        
        switchNotifButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switchNotifButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchNotifButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
}

    // MARK: - Create custom NavigationBarItem

extension MainViewController {
    private func createNavBarItem() -> UIBarButtonItem {
        let notifImage = UIImage(
            systemName: conditionNotification
            ? "bell.badge.fill"
            : "bell"
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

    // MARK: - Create Button

extension MainViewController {
    private func createButton(withTitle title: String, andColor color: UIColor, action: UIAction?) -> UIButton {
        let button = UIButton()
        if #available(iOS 15.0, *) {
            var butAttrubures = AttributeContainer()
            butAttrubures.font = UIFont.boldSystemFont(ofSize: 18)
            
            var buttonConfiguration = UIButton.Configuration.filled()
            buttonConfiguration.title = title
            buttonConfiguration.background.cornerRadius = 20
            
            return UIButton(
                configuration: buttonConfiguration,
                primaryAction: action
            )
        } else {
            button.setTitle(title, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = color
            button.layer.cornerRadius = 20
            button.addTarget(self, action: #selector(test), for: .touchUpInside)
            return button
        }
    }
    
    @objc func test() {}
}
