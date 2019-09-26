//
//  GenreTableCell.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/24/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import Foundation
import UIKit

class GenreTableCell: UITableViewCell, Configurable {

	typealias T = GenreCellModel

	@IBOutlet private var titleLabel: UILabel!

	var model: T?

	private var observation: NSKeyValueObservation?

	func config(with model: T) {
		self.model = model
		self.titleLabel.text = model.genre.description

		// Remove previous observation
		self.observation = nil

		self.updateCheckmark()

		self.observation = model.observe(\.selected) { [unowned self] (model, change) in
			self.updateCheckmark()
		}

	}

	private func updateCheckmark() {
		if let model = self.model {
			self.accessoryType = model.selected ? .checkmark : .none
		}
	}

}
