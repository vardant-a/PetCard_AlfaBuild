//
//  NotificationListViewController.swift
//  PetCard
//
//  Created by Алексей on 01.11.2022.
//

import UIKit

final class NotificationListViewController: UIViewController {
    
    private lazy var notificationList1: [String: String] = [:]
    private lazy var notificationList = [
        "29.10.2022": "1",
        "30.10.2022": "2",
        "31.10.2022": "3",
        "01.11.2022": "4",
        "02.11.2022": "5",
        "03.11.2022": "6",
        "04.11.2022": "7",
    ]
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = .systemGray
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150)
            ])
        return imageView
    }()
    
    private lazy var labelView: UILabel = {
        let label = UILabel()
        label.text = "No notifications"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 36)
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = NSLayoutConstraint.Axis.vertical
        vStack.distribution = UIStackView.Distribution.equalCentering
        vStack.alignment = UIStackView.Alignment.center
        vStack.spacing = 16.0
        
        vStack.addArrangedSubview(imageView)
        vStack.addArrangedSubview(labelView)
        
        return vStack
    }()
    
    private lazy var contentUITableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
   // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavController()
        view.backgroundColor = .systemBackground
        setContentView()
    }
}

 // MARK: - Settings NavigationController
extension NotificationListViewController {
    private func setNavController() {
        title = "Notifications"
    }
}

extension NotificationListViewController {
    private func setContentView() {
        notificationList1.isEmpty
        ? setContentImage()
        : setContentTableView()
    }

    private func setContentImage() {
        view.addSubview(vStack)
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setContentTableView() {
        view.addSubview(contentUITableView)
        
        contentUITableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentUITableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentUITableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentUITableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentUITableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
}
