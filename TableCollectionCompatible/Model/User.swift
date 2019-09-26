//
//  User.swift
//  CleanTableCollectionView
//
//  Created by Su Nguyen on 9/25/19.
//  Copyright © 2019 Su Nguyen. All rights reserved.
//

import Foundation
import UIKit

class User {

	let name: String
	let imageName: String

	var genres: [Genre] = []

	init(name: String, imageName: String) {
		self.name = name
		self.imageName = imageName
	}

}
