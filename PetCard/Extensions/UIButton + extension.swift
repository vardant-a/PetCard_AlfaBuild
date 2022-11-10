//
//  UIButton + extension.swift
//  PetCard
//
//  Created by Алексей on 10.11.2022.
//

import UIKit

extension UIButton {
    // MARK: - Create Button
    
    static func createButton(withTitle title: String, andColor color: UIColor, action: UIAction?, cornerRadius: Double = 12) -> UIButton {
        let button = UIButton()
        if #available(iOS 15.0, *) {
            var butAttrubures = AttributeContainer()
            butAttrubures.font = UIFont.boldSystemFont(ofSize: 18)
            
            var buttonConfiguration = UIButton.Configuration.filled()
            buttonConfiguration.title = title
            buttonConfiguration.baseBackgroundColor = color
            buttonConfiguration.background.cornerRadius = cornerRadius
            
            
            return UIButton(
                configuration: buttonConfiguration,
                primaryAction: action
            )
        } else {
            button.setTitle(title, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = color
            button.layer.cornerRadius = cornerRadius
//            button.addTarget(self, action: #selector(startScanQRCode), for: .touchUpInside)
            return button
        }
    }
}
