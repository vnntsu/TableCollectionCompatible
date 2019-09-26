//
//  TableViewController.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/24/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
	@IBOutlet private var tableView: AutolayoutTableView!
	private var viewModel = TableViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		viewModel.dataSource?.configure(for: tableView)
	}

	@IBAction private func edit(sender: UIButton!) {
		tableView.setEditing(!tableView.isEditing, animated: true)
		updateLeftItem()
	}

	private func updateLeftItem() {
		let systemItem: UIBarButtonItem.SystemItem = tableView.isEditing ? .done : .edit
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: self, action: #selector(edit(sender:)))
	}
}

extension TableViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		viewModel.didSelect(at: indexPath)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
		guard let indexPath = viewModel.dataSource?.tableView(tableView, targetIndexPathForMoveFromRowAt: sourceIndexPath, toProposedIndexPath: proposedDestinationIndexPath) else { return IndexPath(item: 0, section: 0) }
		return indexPath
	}

}
