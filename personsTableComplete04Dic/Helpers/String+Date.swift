//
//  String+Date.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation

extension String
{
    func toDate( dateFormat format  : String) -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        return dateFormatter.date(from: self)!
    }
    
}
