//
//  HomeController.swift
//  PetCard
//
//  Created by Алексей on 21.10.2022.
//

import UIKit
import AVFoundation

final class HomeViewController: UIViewController {
    
    private lazy var conditionNotification = true
    
    // MARK: - Private lazy properties
    
    private lazy var switchNotifButton = UIButton.createSystemButton(self,
        withTitle: "Switch Notification",
        andColor: .systemBlue,
        action: UIAction { [unowned self] _ in
            switchNotifStatus()
                },
        objcAction: #selector(switchNotifStatusOLD)
    )
    
    // MARK: - Ovveride Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setNavController()
        setSwitchButton()
    }
}

    // MARK: - Settings NavigationController
extension HomeViewController {
    private func setNavController() {
        title = "Home"
        
        let navBarItem = createNavBarItem("qrcode.viewfinder")
        navigationItem.rightBarButtonItem = navBarItem
    }
}

    // MARK: - Setting for button switch notification

extension HomeViewController {
    private func setSwitchButton() {
        view.addSubview(switchNotifButton)
        
        switchNotifButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switchNotifButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchNotifButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            switchNotifButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

    // MARK: - Create custom NavigationBarItem
extension HomeViewController {
    private func createNavBarItem(_ systemName: String) -> UIBarButtonItem {
        let notifImage = UIImage(systemName: systemName)
        let navBarItem = UIBarButtonItem(
            image: notifImage,
            style: .plain,
            target: self,
            action: #selector(startScanQRCode)
         )
        
        return navBarItem
    }
}

    // MARK: - Button Methods
extension HomeViewController {
    
    private func switchNotifStatus() {
        conditionNotification.toggle()
        print(conditionNotification)
    }
    
    @objc func switchNotifStatusOLD() {
        conditionNotification.toggle()
        print(conditionNotification)
    }
    
    @objc func startScanQRCode() {
        print("test")
    }
}
