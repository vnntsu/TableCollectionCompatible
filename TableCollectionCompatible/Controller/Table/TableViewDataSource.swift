//
//  TableViewDataSource.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/24/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import Foundation
import UIKit

enum Sections: Int {
	case UserSection
	case GenreSection
}

class TableViewDataSource: NSObject, TableViewData, UITableViewDataSource {

	var tableView: UITableView? {
		didSet {
			guard let tableView = tableView else { return }
			tableView.dataSource = self
			tableView.reloadData()
		}
	}
	var sections: [TableViewSection] = []

	init(sections: [TableViewSection]) {
		self.sections = sections
	}

	convenience init(items: [TableViewCompatible]) {
		let section = TableViewSection(sortOrder: 0, items: items)
		self.init(sections: [section])
	}

	func configure(for tableView: UITableView) {
		self.tableView = tableView
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return numberOfSections()
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = sections[indexPath.section].items[indexPath.item]
		return model.cell(for: tableView, at: indexPath)
	}

	// Optional

	open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return self.titleForHeaderInSection(section: section)
	}

	open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		return self.titleForFooterInSection(section: section)
	}

	open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return self[indexPath].editable
	}

	open func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		return self[indexPath].movable
	}

	open func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

		// If you need to update a deeper model, ie. a database or similar, or you need to support insertion, you probably want to provide your own implementation of this function.

		switch editingStyle {
			case .none:
				break
			case .insert:
				insertItem(atIndexPath: indexPath)
				tableView.insertRows(at: [indexPath], with: .automatic)
			case .delete:
				deleteItem(atIndexPath: indexPath)
				tableView.deleteRows(at: [indexPath], with: .automatic)
			@unknown default:
				// Ignoring all unknown
				break
		}
	}

	open func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

		// If you need to update a deeper model, ie. a database or similar, you probably want to provide your own implementation of this function.

		let item = self.sections[sourceIndexPath.section].items.remove(at: sourceIndexPath.row)
		self.sections[destinationIndexPath.section].items.insert(item, at: destinationIndexPath.row)
	}

	open func insertItem(atIndexPath indexPath: IndexPath) {
		// Override in subclass if needed
	}

	open func deleteItem(atIndexPath indexPath: IndexPath) {
		self.sections[indexPath.section].items.remove(at: indexPath.row)
	}
}

extension TableViewDataSource: UITableViewDataSourcePrefetching {

	open func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
		self.prefetchObjectsAtIndexPaths(indexPaths: indexPaths)
	}

	open func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
		self.cancelPrefetchingObjectsAtIndexPaths(indexPaths: indexPaths)
	}

}

extension TableViewDataSource: UITableViewDelegate {

	open func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {

		// We need to check if the proposedDestinationIndexPath is out of bounds. This will happen when moving a cell past the last cell in the table view.

		let proposedSection = proposedDestinationIndexPath.section
		let proposedRow = proposedDestinationIndexPath.row

		let cellToReplace: TableViewCompatible?

		if proposedSection >= self.sections.count {
			// The proposed section is out of bounds. This really should not happen, but just to be safe, we perform this check.
			cellToReplace = self.sections.last?.items.last
		} else if proposedRow >= self.sections[proposedSection].items.count {
			// The proposed row is out of bounds so we use the last cell to check if movement is allowed.
			cellToReplace = self.sections[proposedSection].items.last
		} else {
			// We are all good, so we can check the cell at the proposedDestinationIndexPath.
			cellToReplace = self[proposedDestinationIndexPath]
		}

		// We only allow movement if the cell at the destination is movable.
		if let cellToReplace = cellToReplace, cellToReplace.movable {
			return proposedDestinationIndexPath
		} else {
			return sourceIndexPath
		}
	}
}

