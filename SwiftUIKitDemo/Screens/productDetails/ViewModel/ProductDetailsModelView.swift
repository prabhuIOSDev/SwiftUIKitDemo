//
//  ProductDetailsModelView.swift
//  SwiftUIKitDemo
//
//  Created by Prabhu Devar on 16/08/25.
//

import Foundation

final class ProductDetailsModelView {
    private  let  product: Prodouct
    
    init(product: Prodouct){
        self.product = product
    }
    
    
    var image:String{
        return product.image
    }
    
    var title:String{
        return product.title
    }
    
    var category: String {
        
        return product.category
    }
    
    var discription:String{
        return product.description
    }
    var price:String{
        return "₹\(product.price)"
    }
    
    var rating:String{
        return  "\(product.rating.rate)"
    }

}
