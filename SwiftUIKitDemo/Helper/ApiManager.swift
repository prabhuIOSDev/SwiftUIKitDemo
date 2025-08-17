//
//  ApiManager.swift
//  SwiftUIKitDemo
//
//  Created by Prabhu Devar on 13/08/25.
//

import Foundation

// Singaltone class

// final -> you can't inheritancs this class only use shard properties

typealias Handler = (Result<[Prodouct],DataEror>) -> Void

final class ApiManager{
    
    static let shared = ApiManager()
    
  private  init (){
        
    }
    
    func fetchProduct(competion: @escaping Handler) {
        guard let url = URL(string: Constant.Api.productsUrl) else{return}
        URLSession.shared.dataTask(with: url){ data,response,error in
            guard let data else {
                competion(.failure(.invalidData))
                return
                
            } // if data is nil not moving forworad ..
            guard let response = response as? HTTPURLResponse ,
            200 ... 299 ~= response.statusCode else {
                competion(.failure(.invalidResponse))
                return}
            // JSONDecoder -> its convert data to model array or model
            do{
                let products = try JSONDecoder().decode([Prodouct].self, from: data)
                competion(.success(products))
            }catch {
                competion(.failure(.message(error)))
            }
            
        }.resume()
    }
    
    
}

