//
//  postEdnpoint.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 6/6/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import Foundation
struct postEndpoint: Endpoint {
    var path: String
    var queryItems: [URLQueryItem]? = nil
    var body: filter    
    var fiter: Data{
            return try! JSONEncoder().encode(body)
    }
}

struct getEndpoint: Endpoint {
    var path: String
    var queryItems: [URLQueryItem]?
    
}
