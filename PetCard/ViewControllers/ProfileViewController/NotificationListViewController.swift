//
//  NotificationListViewController.swift
//  PetCard
//
//  Created by Алексей on 01.11.2022.
//

import UIKit

final class NotificationListViewController: UIViewController {
    
    private lazy var notificationList = Notification.getList(TestNotifDate.shared.sortNotifList())
    
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
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = false
        return tableView
    }()
    
   // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notifications"
        setViewContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
}
// MARK: - Set View content
extension NotificationListViewController {
    private func setViewContent() {
        notificationList.isEmpty
        ? setStackContent()
        : setTableViewContent()
    }

    private func setStackContent() {
        view.addSubview(vStack)
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: Content setting in UITableView
extension NotificationListViewController: UITableViewDelegate, UITableViewDataSource {
    // Получим количество секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        notificationList.count
    }
    
    // Получим заголовок для секции
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         notificationList[section].datе
     }
    
    // Получим количество строк для конкретной секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notificationList[section].description.count
    }
    
    // Отображение данных уведомлений в строке
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = notificationList[indexPath.section].description[indexPath.row]
        
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Set TableView content
    private func setTableViewContent() {
        view.addSubview(contentUITableView)
        contentUITableView.delegate = self
        contentUITableView.dataSource = self

        contentUITableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentUITableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentUITableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentUITableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentUITableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
