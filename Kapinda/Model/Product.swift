//
//  File.swift
//  Kapinda
//
//  Created by dogukangokova on 7.10.2022.
//



import SwiftUI

struct Product: Identifiable {
    var id = UUID().uuidString
    var productImage: String
    var productTitle: String
    var productPrice: String
    var productCat: String
    var productWidth: CGFloat
    var productHeight: CGFloat
    var productDesc: String
    var productBG: Color
    var isLiked: Bool = false
    var productRating: Int
}

var products = [
    Product(productImage: "cola", productTitle: "Coca-Cola", productPrice: "₺14,50", productCat: "icecekler", productWidth: 128,  productHeight: 120, productDesc: "1 L", productBG: Color.red, isLiked: true, productRating: 5),
    Product(productImage: "cips", productTitle: "Ruffles", productPrice: "₺10,20",productCat: "atistirmalik", productWidth: 80, productHeight: 120, productDesc: "350 gr", productBG: Color.orange, isLiked: true, productRating: 3),
    Product(productImage: "temelgida", productTitle: "Ekmek", productPrice: "₺5,25",productCat: "temelgida", productWidth: 80,  productHeight: 120, productDesc: "300 gr", productBG: Color.yellow, isLiked: true, productRating: 3),
    
]

