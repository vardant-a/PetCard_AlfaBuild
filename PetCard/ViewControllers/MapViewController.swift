//
//  MapViewController.swift
//  PetCard
//
//  Created by Алексей on 31.10.2022.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {
    
    private var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search animal"
        search.searchBar.tintColor = .systemBlue
        return search
    }()
    
    private var mapKitView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()
    
    private let coordinateUser = CLLocationCoordinate2D(
        latitude: 40.728,
        longitude: -74
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        
        view.addSubview(mapKitView)
        mapKitView.setRegion(MKCoordinateRegion(
            center: coordinateUser,
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1)),
            animated: false
        )
        setConstraints()
    }
}

// MARK: - Setting for NavigationBar
extension MapViewController {
    private func setNavBar() {
        title = "Animal Map"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
}

// MARK: - Setting Constrains
extension MapViewController {
    private func setConstraints() {
        mapKitView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapKitView.topAnchor.constraint(equalTo: view.topAnchor),
            mapKitView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapKitView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapKitView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MapViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
    }
}
