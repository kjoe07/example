//
//  getLoader.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 6/16/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import Foundation
class getLoader: productLoader{
    func loadData<T:Codable>(params: parameters, completion: @escaping (resultados<T>) -> Void) {
        let request = requestManager()
        request.request(params: params, then: {result in
            switch result{
            case .failure(let error):
                completion(.error(Error: error))
            case .success(let data):
                do{
                    let myData = try JSONDecoder().decode(T.self, from: data)
                    completion(.datos(Dato: myData))
                }catch{
                    completion(.error(Error: error))
                }
            }
        })
    }
}
