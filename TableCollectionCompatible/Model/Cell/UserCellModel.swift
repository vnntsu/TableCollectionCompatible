//
//  UserCellModel.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/25/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import Foundation
import UIKit

class UserCellModel: TableViewCompatible {

	var reuseIdentifier: String {
		return "UserCellModel"
	}

	let imageName: String
	let userName: String

	var selected: Bool = false
	var editable: Bool = false
	var movable: Bool = false

	init(userName: String, imageName: String) {
		self.userName = userName
		self.imageName = imageName
	}

	convenience init(user: User) {
		self.init(userName: user.name, imageName: user.imageName)
	}

	func cell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? UserTableCell else {
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
