//
//  TableViewSection.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/25/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import Foundation

open class TableViewSection {
	var sortOrder: Int
	var items: [TableViewCompatible]
	var headerTitle: String?
	var footerTitle: String?

	init(sortOrder: Int, items: [TableViewCompatible], headerTitle: String? = nil, footerTitle: String? = nil) {
		self.sortOrder = sortOrder
		self.items = items
		self.headerTitle = headerTitle
		self.footerTitle = footerTitle
	}

}
