//
//  parameters.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 5/21/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import Foundation
enum parameters {
    case Endpoint(endpoint: Endpoint)
    case string(string: String)
}

enum resultados<T>{
    case datos(Dato: T)
    case error(Error: Error)
}
