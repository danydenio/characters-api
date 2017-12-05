//
//  IndexPath+Sorting.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/5/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation

extension IndexPath {
    static func getSortedIndexPathRows(indexPathArray: [IndexPath]) -> [Int]{
        var indexArray: [Int] = []
        for item in indexPathArray {
            indexArray.append(item.row)
        }
        return indexArray.sorted(by: >)
    }
}
