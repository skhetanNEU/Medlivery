//
//  SearchTableViewManager.swift
//  App14
//
//  Created by Aadesh Mallya on 3/15/24.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mapItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.searchTableViewID, for: indexPath) as! SearchTableViewCell
        if let name = mapItems[indexPath.row].name{
                cell.labelTitle.text = name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for mapItem in mapItems {
            delegateToMapView.showSelectedPlace(placeItem: mapItem)
        }
        self.dismiss(animated: true)
    }
}
