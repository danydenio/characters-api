//
//  Date+String.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
