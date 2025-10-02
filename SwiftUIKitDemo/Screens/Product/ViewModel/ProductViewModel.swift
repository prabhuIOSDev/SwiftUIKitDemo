//
//  ProductViewModel.swift
//  SwiftUIKitDemo
//
//  Created by Prabhu Devar on 13/08/25.
//

import Foundation
//


final class ProductViewModel{
    
    var products :[Prodouct] = []
    var eventHandler :((_ event :Event)->Void)?  // clouser .... data binding
    
    
  func fetchProductDataApi(){
      self.eventHandler?(Event.loading)
      ApiManager.shared.fetchProduct { response in
          self.eventHandler?(Event.stopLoading)
          switch response{
          case .success(let product):
              self.products = product
              self.eventHandler?(Event.dataLoaded)
          case .failure(let error):
              self.eventHandler?(Event.error(error))
          }
      }
    }
}

extension ProductViewModel{
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        
    }
}
