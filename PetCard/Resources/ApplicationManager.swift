//
//  ApplicationManager.swift
//  PetCard
//
//  Created by Алексей on 25.11.2022.
//

import UIKit

final class ApplicationManager {
    
    static let shared = ApplicationManager()
    
    //  MARK: - Call User
    func callTo(_ number: String) {
        guard let url = URL(string: "tel://\(number)") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    // MARK: - GenerateQRCode for AnimalCard
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
    
    private init() {}
}
