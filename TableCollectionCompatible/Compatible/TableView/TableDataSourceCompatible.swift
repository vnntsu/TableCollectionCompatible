//
//  TableDataSourceCompatible.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/25/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import UIKit

protocol TableDataSourceCompatible {
	associatedtype T

	var dataSource: T? { get set }
}
