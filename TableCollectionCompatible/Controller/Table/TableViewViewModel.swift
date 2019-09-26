//
//  TableViewViewModel.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/25/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import Foundation

class TableViewViewModel: TableDataSourceCompatible {
	typealias T = TableViewDataSource

	private var user: User = User(name: "Su Nguyen", imageName: "monkeyking.jpg")
	private var genres: [Genre] = Genre.allGenres
	private var sections = [TableViewSection]()

	var dataSource: T?

	init() {
		prepareData()
	}

	private func prepareData() {
		let userCellModel = UserCellModel(user: user)

		var items = [TableViewCompatible]()
		for genre in genres {
			let genreCellModel = GenreCellModel(genre: genre)
			genreCellModel.selected = user.genres.contains(genre)
			items.append(genreCellModel)
		}

		let userSection = TableViewSection(sortOrder: Sections.UserSection.rawValue, items: [userCellModel])

		let section = TableViewSection(sortOrder: Sections.GenreSection.rawValue, items: items, headerTitle: "Genres", footerTitle: nil)

		sections = [userSection, section].sorted {
			return $0.sortOrder < $1.sortOrder
		}

		dataSource = T(sections: sections)
	}
}

extension TableViewViewModel {
	func didSelect(at indexPath: IndexPath) {
		guard let section = sections[safe: indexPath.section], let model = section.items[safe: indexPath.row] as? GenreCellModel else { return }

		if let index = user.genres.firstIndex(of: model.genre) {
			user.genres.remove(at: index)
			model.selected = false
		} else {
			user.genres.append(model.genre)
			model.selected = true
		}
	}
}

extension Array {
	public subscript(safe index: Int) -> Element? {
		guard index < self.count else { return nil }
		return self[index]
	}
}
