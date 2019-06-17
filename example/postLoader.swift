//
//  postLoader.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 6/16/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import Foundation
class postLoader: productLoader{
    func loadData<T: Codable>(params: parameters, completion: @escaping (resultados<T>) -> Void) {
        let request = requestManager()
        request.post(params: params, with: {result in
            switch result{
            case .success(let data):
                do {
                    let mydata = try JSONDecoder().decode(T.self, from: data)
                    completion(.datos(Dato: mydata))
                }
                catch{
                    completion(.error(Error: error))
                }
            case .failure(let error):
                completion(.error(Error: error))
            }
        })
    }
}
