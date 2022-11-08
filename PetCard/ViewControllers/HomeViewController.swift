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
            switchNotifButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
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

    // MARK: - Create Button

extension HomeViewController {
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
            button.addTarget(self, action: #selector(startScanQRCode), for: .touchUpInside)
            return button
        }
    }
    
    @objc func startScanQRCode() {}
}
