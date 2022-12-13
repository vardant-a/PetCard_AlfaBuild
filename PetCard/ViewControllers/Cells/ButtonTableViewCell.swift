//
//  ButtonTableViewCell.swift
//  PetCard
//
//  Created by Aleksei on 08.12.2022.
//

import UIKit

final class ButtonTableViewCell: UITableViewCell {
    
    // MARK: - Static property for identification cell
    static let cellID = "ButtonTableViewCell"
    
    // MARK: - Private lazy property
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Test", for: .normal)
        button.backgroundColor = .barColor ?? .systemGray
        button.setTitleColor(.red, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(target, action: #selector(testAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Override init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.button = button
        contentView.addSubview(button)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    // MARK: - @objc methods for button
extension ButtonTableViewCell {
    @objc func testAction() {
        print("Нажатие кнопки")
    }
}
    // MARK: - Constrains for Button
extension ButtonTableViewCell {
    private func setConstrains() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
