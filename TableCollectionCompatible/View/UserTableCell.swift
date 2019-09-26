//
//  UserTableCell.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/25/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import UIKit

class UserTableCell: UITableViewCell, Configurable {

	@IBOutlet private weak var userImageView: UIImageView!
	@IBOutlet private weak var userNameLabel: UILabel!

	var model: UserCellModel?

	func config(with model: UserCellModel) {
		self.model = model
		userImageView.image = UIImage(named: model.imageName)
		userNameLabel.text = model.userName
		configView()
	}

	private func configView() {
		userImageView.layer.cornerRadius = userImageView.frame.height / 2
		userImageView.layer.borderColor = UIColor.red.cgColor
		userImageView.layer.borderWidth = 1
	}
}
