//
//  requestManager.swift
//  shopping
//
//  Created by Yoel Jimenez del Valle on 6/14/19.
//  Copyright © 2019 yoel jimenez del valle. All rights reserved.
//

import Foundation
class requestManager {
    var myurl: URL!
    var body: Data!
    func request( params: parameters,then handler: @escaping (Result<Data, Error>) -> Void) {
        switch params {
        case .Endpoint(let endpoint):
            guard let url = endpoint.url else { return handler(.failure(NetworkError.badURL))}
            myurl = url
        case .string(let string):
            guard let url = URL(string: string) else { return handler(.failure(NetworkError.badURL))}
            myurl = url
        }
        
        URLSession.shared.dataTask(with: myurl){ data, response, error in
            guard(error == nil) else { print("\(String(describing: error?.localizedDescription))"); return }
            print("response: ")
            print(response.debugDescription)
            let result  =  (data != nil && error == nil) ? Result.success(data!) : Result.failure(error!)
            handler(result)
            }.resume()
    }
    func post(params: parameters, with handler: @escaping (Result<Data,Error>) -> Void){
        switch params {
        case .Endpoint(let endpoint):
            guard let url = endpoint.url else { return handler(.failure(NetworkError.badURL))}
            myurl = url
            body = (endpoint as! postEndpoint).fiter
        case .string(let string):
            guard let url = URL(string: string) else { return handler(.failure(NetworkError.badURL))}
            myurl = url
            body = Data()
        }
        var request = URLRequest(url: myurl)
        request.httpBody = body
        request.httpMethod = "post"
        URLSession.shared.uploadTask(with: request, from: nil, completionHandler: {(data, response, error) in
            guard(error == nil) else { print("\(String(describing: error?.localizedDescription))");  return }
            print("response: ")
            print(response.debugDescription)
            let result  =  (data != nil && error == nil) ? Result.success(data!) : Result.failure(error!)
            handler(result)
        }).resume()
    }
}

//    func request(_ endpoint: Endpoint? = nil ,_ url:String? = nil,then handler: @escaping (Result<Data, Error>) -> Void) {
//        let myurl: URL!
//        if endpoint != nil {
//            guard let url = endpoint!.url else { return handler(.failure(NetworkError.badURL))}
//            myurl = url
//        }else {
//            guard let url = URL(string: url!) else { return handler(.failure(NetworkError.badURL))}
//            myurl = url
//        }
//        URLSession.shared.dataTask(with: myurl){ data, response, error in
//            guard(error == nil) else {
//                print("\(String(describing: error?.localizedDescription))")
//                return
//            }
//            print("response: ")
//            print(response.debugDescription)
//            let result  =  (data != nil && error == nil) ? Result.success(data!) : Result.failure(error!)
//            handler(result)
//            }.resume()
//    }
//}
