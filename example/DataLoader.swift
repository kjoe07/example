//
//  DataLoader.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 5/14/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import UIKit
protocol productLoader {
    func loadData<T:Codable>(params: parameters,completion: @escaping (resultados<T>) -> Void)
}
class dataLoader:productLoader{
    let get = getLoader()
    let post = postLoader()
    func loadData<T: Codable>(params: parameters, completion: @escaping (resultados<T>) -> Void){
        switch params {
        case .Endpoint(_):
            post.loadData(params: params, completion: {result in
                completion(result)
            })
        case .string(_):
            get.loadData(params: params, completion: {result in
                completion(result)
            })
        }
    }
}
