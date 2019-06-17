//
//  queryBuilder.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 6/14/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import Foundation
class queryBuilder{
    var text: String
    init(text: String) {
        self.text = text
    }
    func mypostEndpoint(path: String) -> Endpoint{
        var filterValue = filterManager.shared.getFilter() ?? filter(text: text, departamentos: [""], municipios: [""], rebajados: false)
        filterValue.text = text
        let post = postEndpoint(path: path, queryItems: nil, body: filterValue )
        return post        
    }
}
