//
//  UIButton + extension.swift
//  PetCard
//
//  Created by Алексей on 10.11.2022.
//

import UIKit

extension UIButton {
    
    // MARK: - Create System Button
    
    static func createSystemButton(_ target: Any?, withTitle title: String, andColor color: UIColor, action: UIAction?, objcAction: Selector) -> UIButton {
        if #available(iOS 15.0, *) {
            var butAttrubures = AttributeContainer()
            butAttrubures.font = UIFont.boldSystemFont(ofSize: 17)
            
            var buttonConfiguration = UIButton.Configuration.filled()
            buttonConfiguration.title = title
            buttonConfiguration.baseForegroundColor = color
            buttonConfiguration.baseBackgroundColor = .barColor ?? .white
            buttonConfiguration.background.cornerRadius = 8
            
            return UIButton(
                configuration: buttonConfiguration,
                primaryAction: action
            )
        } else {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.backgroundColor = .barColor ?? .systemGray
            button.setTitleColor(.red, for: .normal)
            button.layer.cornerRadius = 8
            button.addTarget(target, action: objcAction, for: .touchUpInside)
            return button
        }
    }
    
    static func createSheetButton(_ target: Any?, action: UIAction?) -> UIButton {
        let button = UIButton(type: .system)
        let btnImage = UIImage(named: "poweron")
        button.setTitleColor(.white, for: .normal)
        button.setImage(btnImage, for: .normal)
        
        return button
    }
}
