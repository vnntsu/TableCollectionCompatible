//
//  TableViewCompatible.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/24/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import Foundation
import UIKit


public protocol TableViewCompatible: CollectionAndTableViewCompatible {
	var reuseIdentifier: String { get }

	func cell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}
