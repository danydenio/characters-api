//
//  NetworkManager.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/5/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation

final class NetworkManager {
    weak var delegate: NetoworkManagerDelegate?
    
    func downloadRequest(URLString: String) {
        if let URL = URL(string: URLString) {
            let task = URLSession.shared.dataTask(with: URL) { [weak self] (data, response, error) in
                if error == nil {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                            DispatchQueue.main.async {
                                let results = User.parseIntoArray(JSONArray: jsonArray)
                                self?.delegate?.didDownloadParsedRequest(requestArray: results)
                                if let url2 = jsonArray["next"] as? String {
                                    self?.downloadRequest(URLString: url2)
                                }
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print(error as Any)
                }
            }
            task.resume()
        }
    }
}
