//
//  SheetView.swift
//  PetCard
//
//  Created by Aleksei on 01.12.2022.
//

import UIKit

final class SheetView: UIView {
    private lazy var sheetButton = UIButton.createSheetButton(
        self,
        action: UIAction { _ in
        print("Button Active")
    })
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .barColor
        layer.cornerRadius = 20
        self.addElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension SheetView {
    private func addElements() {
        self.addSubview(sheetButton)
        sheetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sheetButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sheetButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])
    }
}
