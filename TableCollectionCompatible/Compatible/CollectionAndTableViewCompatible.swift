//
//  CollectionAndTableViewCompatible.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/26/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

public protocol CollectionAndTableViewCompatible {

	var reuseIdentifier: String { get }

	var selected: Bool { get set }
	var editable: Bool { get }
	var movable: Bool { get }

	func prefetch()
	func cancelPrefetch()

}
