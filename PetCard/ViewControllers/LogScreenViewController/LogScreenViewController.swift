//
//  LogScreenViewController.swift
//  PetCard
//
//  Created by Aleksei on 30.11.2022.
//

import SwiftUI

final class LogScreenViewController: UIViewController {
    
    // MARK: - Private lazy properties (HostingController for LogScreenView)
    
    private lazy var hostingController: UIHostingController = {
        let hostingController = UIHostingController(
            rootView: LogScreenView(buttonAction: { self.prepareForApp() })
        )
        if #available(iOS 16.0, *) {
            hostingController.sizingOptions = .preferredContentSize
        } else {
            // Fallback on earlier versions
        }
        return hostingController
    }()
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presentLoginView()
    }
    private func prepareForApp() {
        let tabBar = MainTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        tabBar.modalTransitionStyle = .crossDissolve
        present(tabBar, animated: true)
    }
}
    // MARK: - Add LogView and hostingController, settings constrains
extension LogScreenViewController {
    private func presentLoginView() {
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

    // MARK: - Live PreviewProvider
struct LogScreenViewProvider: PreviewProvider {
    static var previews: some View {
        LogScreenViewController().showPreview()
    }
}
