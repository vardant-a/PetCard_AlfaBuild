//
//  Notification.swift
//  PetCard
//
//  Created by Алексей on 08.11.2022.
//

import Foundation

// MARK: - Testing Notification Data
final class TestNotifDate {
 static let shared = TestNotifDate()
    
    var notifications = [
        "29.10.2022": ["1.1", "1.2"],
        "30.10.2022": ["2.1", "2.2"],
        "31.10.2022": ["3.1", "3.2"],
        "01.11.2022": ["4.1", "4.2"]
    ]
    
    // Cортировка словаря
    func sortNotifList() -> [String: [String]] {
        let sorted = notifications.sorted(by: { $0.key < $1.key })
        var newDict: [String: [String]] = [:]
        for sortedDict in sorted {
            newDict[sortedDict.key] = sortedDict.value
        }
        return newDict
    }

    private init() {}
}

// MARK: - Filter for Notification List
struct Notification {
    var datе: String!
    var description: [String]!
    
    static func getList(_ notifications: [String: [String]]) -> [Notification] {
        var notificationList: [Notification] = []
        for (key, value) in notifications {
            notificationList.append(Notification(datе: key, description: value))
        }
        return notificationList
    }
}
