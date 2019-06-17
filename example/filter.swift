//
//  filter.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 6/6/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import Foundation
struct filter:Codable {
    var text: String?
    var departamentos: [String]?
    var municipios: [String]?
    var rebajados = false
}
