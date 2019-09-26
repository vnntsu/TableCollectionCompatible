//
//  AutoLayoutTableView.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/25/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import UIKit

extension UITableView {

	func enableAutolayoutForCellHeights(estimatedRowHeight: CGFloat = 44) {
		self.estimatedRowHeight = estimatedRowHeight
		rowHeight = UITableView.automaticDimension
	}

}

class AutolayoutTableView: UITableView {

	override func awakeFromNib() {
		super.awakeFromNib()
		self.enableAutolayoutForCellHeights()
	}

}
