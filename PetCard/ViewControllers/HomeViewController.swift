//
//  HomeController.swift
//  PetCard
//
//  Created by Алексей on 21.10.2022.
//

import UIKit
import SwiftUI

final class HomeViewController: UIViewController {
    
    private var conditionNotification = true
    
    private var animalList: [Animal] = [getAnimal]
    
    // MARK: - Private lazy properties
    
    private lazy var hostingController: UIHostingController = {
        let hostingController = UIHostingController(
            rootView: CardStackView()
        )
        if #available(iOS 16.0, *) {
            hostingController.sizingOptions = .preferredContentSize
        } else {
            // Fallback on earlier versions
        }
        return hostingController
    }()
    
    // MARK: - Ovveride Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavController()
        view.backgroundColor = .systemBackground
        
        presentAnimalCad()
    }
}
    // MARK: - Adding SwiftUI View for HomeViewController
extension HomeViewController {
    private func presentAnimalCad() {
        self.addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        setHostingViewConstrains()
    }
    
    private func setHostingViewConstrains() {
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
    
    // Methods for navigationItem
    @objc func startScanQRCode() {
        print("test")
    }
}
