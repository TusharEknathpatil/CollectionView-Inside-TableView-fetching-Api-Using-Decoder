//
//  ApiResponse.swift
//  Api-nested-BindData-in -Nested-view
//
//  Created by Mac on 19/05/23.
//

import Foundation

struct ApiResponse:Codable {
    var products:[Product]
    var total:Int
    var skip:Int
    var limit:Int

}

struct Product:Codable {
    var id:Int
    var title:String
    var description:String
    var price:Int
    var thumbnail:String
    var images:[String]
}
