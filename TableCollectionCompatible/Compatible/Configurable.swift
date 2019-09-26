//
//  Configurable.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/24/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import Foundation

protocol Configurable {

	associatedtype T

	var model: T? { get set }
	func config(with model: T)
}
