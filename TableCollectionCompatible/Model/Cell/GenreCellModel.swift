//
//  GenreCellModel.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/24/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import Foundation
import UIKit

class GenreCellModel: NSObject, TableViewCompatible {

	var reuseIdentifier: String {
		return "GenreCellModel"
	}

	let genre: Genre

	@objc dynamic var selected: Bool = false

	var editable: Bool = true
	var movable: Bool = true

	init(genre: Genre) {
		self.genre = genre
	}

	func cell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? GenreTableCell else {
			return UITableViewCell()
		}
		cell.config(with: self)
		return cell
	}

	func prefetch() {
		// Perform prefetching, for instance fetching data from the internet
	}

	func cancelPrefetch() {
		// Cancel any prefetching started in prefetch()
	}
}
