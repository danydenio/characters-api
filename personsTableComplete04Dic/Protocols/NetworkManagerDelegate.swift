//
//  NetworkManagerDelegate.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/5/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation

protocol NetoworkManagerDelegate: class {
    func didDownloadParsedRequest(requestArray: [Any])
}
