//
//  Product.swift
//  SwiftUIKitDemo
//
//  Created by Prabhu Devar on 13/08/25.
//

import Foundation



struct Prodouct : Decodable{
    let id:Int
    let title:String
    let price: Double
    let description:String
    let category:String
    let image:String
    let rating:Rate
    
 
    
    
}

struct Rate :Decodable{
    let rate:Double
    let count:Int
}
