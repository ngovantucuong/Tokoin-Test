//
//  NetworkManager.swift
//  Tokoin-Test
//
//  Created by ngovantucuong on 9/13/20.
//  Copyright © 2020 ngovantucuong. All rights reserved.
//

import Foundation
import UIKit

typealias result = (_ data: [Articles]) -> Void

class NetworkManager {
    static let shared = NetworkManager(baseURL: URL(string: URL_GET_DATA))

    // MARK: - Properties
    let baseURL: URL?
    let session = URLSession(configuration: .default)

    // Initialization
    private init(baseURL: URL?) {
        self.baseURL = baseURL
    }
    
    // MARK: Function
    func getData(completion: @escaping (result)) {
        guard let baseURL = baseURL else { return }
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            if (error != nil) { return }
            do {
                guard let data = data else { return }
                let values = try JSONDecoder().decode(News.self, from: data)
                completion(values.articles ?? [])
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }

}
