//
//  CalendarViewController.swift
//  PetCard
//
//  Created by Алексей on 31.10.2022.
//

import UIKit

final class CalendarViewController: UIViewController {
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Calendar"
        
        configureCalendar()
    }
}

    // MARK: - Create Calendar
extension CalendarViewController {
    private func configureCalendar() {
        if #available(iOS 16.0, *) {
            let calendarView = UICalendarView()
            calendarView.calendar = .current
            calendarView.locale = .current
            
            view.addSubview(calendarView)
            calendarView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                calendarView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                calendarView.heightAnchor.constraint(equalToConstant: 300)
            ])
        } else {
            // For Version iOS 14.0
        }
    }
}
