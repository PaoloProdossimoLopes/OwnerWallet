//
//  HomeUIComponents.swift
//  
//
//  Created by Paolo Prodossimo Lopes on 15/01/22.
//

import UIKit

final class HomeUIComponents {
    let searchBar: UISearchController = {
        let bar = UISearchController()
        return bar
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        return view
    }()
}
