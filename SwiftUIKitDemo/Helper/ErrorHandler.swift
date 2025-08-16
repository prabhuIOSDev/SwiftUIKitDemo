//
//  ErrorHandler.swift
//  SwiftUIKitDemo
//
//  Created by Prabhu Devar on 13/08/25.
//

import Foundation

enum DataEror:Error{
    case invalidResponse
    case invalidUrl
    case invalidData
    case message(_ error : Error?)
}
