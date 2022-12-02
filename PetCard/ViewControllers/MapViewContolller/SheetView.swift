//
//  SheetView.swift
//  PetCard
//
//  Created by Aleksei on 01.12.2022.
//

import SwiftUI

final class SheetView: UIView {
    
    private var closedSheetMenu = true
    
    private lazy var sheetButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.addAction(
            UIAction { [unowned self] _ in
                actionSheetButton()
            },
            for: .touchUpInside
        )
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .barColor
        layer.cornerRadius = 20
        addElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension SheetView {
    private func addElements() {
        self.addSubview(sheetButton)
        if closedSheetMenu {
            UIView.animate(withDuration: 0.3, animations: {
                NSLayoutConstraint.activate([
                    self.heightAnchor.constraint(equalToConstant: 50)
                ])
                self.layoutIfNeeded()
            }) { [unowned self] _ in
                closedSheetMenu = false
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                NSLayoutConstraint.activate([
                    self.heightAnchor.constraint(equalToConstant: 300)
                ])
                self.layoutIfNeeded()
            }) { [unowned self] _ in
                closedSheetMenu = true
            }
        }
        sheetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sheetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            sheetButton.topAnchor.constraint(equalTo: topAnchor)
        ])
        
    }
    
    private func actionSheetButton() {
        print("Tuch1")
        addElements()
    }
}

struct SheetProvider: PreviewProvider {
    static var previews: some View {
        MapViewController().showPreview()
    }
}
