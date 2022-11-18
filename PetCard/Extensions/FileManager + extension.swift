//
//  FileManager + extension.swift
//  PetCard
//
//  Created by Алексей on 18.11.2022.
//

import UIKit

extension FileManager {
    static var docDirURL: URL {
        return self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: FileManager.docDirURL.appendingPathComponent(docName).path)
    }
}
