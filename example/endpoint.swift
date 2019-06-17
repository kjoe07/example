//
//  endpoint.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 5/14/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import Foundation
protocol Endpoint {
    var path: String { get set}
    var queryItems: [URLQueryItem]? { get set}
}
extension Endpoint {
    // We still have to keep 'url' as an optional, since we're
    // dealing with dynamic components that could be invalid.
    var url: URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "dhayservice.cimex.com.cu"
        components.port = 1703
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
enum NetworkError: Error {
    case badURL
}
