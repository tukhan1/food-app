//
//  DTO.swift
//  food-app
//
//  Created by Egor Tushev on 14.08.2024.
//

import Foundation

struct Product: Hashable, Identifiable {
    let id = UUID()
    let category: String?
    var sale: Int?
    let name: String
    var countryName: String?
    let imageName: String
    let rate: String
    let price: Double
    let priceWithoutSale: Double
    let favorite: Bool
}

struct MockData {
    static let sampleProduct = Product(category: "Цена по карте",
                                       sale: 25,
                                       name: "Яблоко красное и не очень красное но крутое и классное",
                                       countryName: "Франция",
                                       imageName: "apple",
                                       rate: "4.2",
                                       price: 222.34,
                                       priceWithoutSale: 400.00,
                                       favorite: false)
    
    static let products = [sampleProduct,
                           Product(category: "Новинки",
                                   sale: 25,
                                   name: "Яблоко красное2",
                                   countryName: "Франция",
                                   imageName: "apple",
                                   rate: "4.1",
                                   price: 222.34,
                                   priceWithoutSale: 400.00,
                                   favorite: false),
                           Product(category: "Новинки",
                                   sale: 25,
                                   name: "Яблоко красное1",
                                   countryName: "Франция",
                                   imageName: "apple",
                                   rate: "4.1",
                                   price: 222.34,
                                   priceWithoutSale: 400.00,
                                   favorite: false),
                           Product(category: "Новинки",
                                   sale: 25,
                                   name: "Яблоко красное и не очень красное но крутое и классное Яблоко красное и не очень красное но крутое и классное",
                                   countryName: "Франция",
                                   imageName: "apple",
                                   rate: "4.1",
                                   price: 222.34,
                                   priceWithoutSale: 400.00,
                                   favorite: false),
                           Product(category: "Новинки",
                                   sale: 25,
                                   name: "Яблоко красное3",
                                   countryName: "Франция",
                                   imageName: "apple",
                                   rate: "4.1",
                                   price: 222.34,
                                   priceWithoutSale: 400.00,
                                   favorite: false)]
}
