//
//  FoodViewModel.swift
//  food-app
//
//  Created by Egor Tushev on 19.08.2024.
//

import SwiftUI

final class ProductsViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isGridView = true
    
    init() {
        loadProducts()
    }
    
    func loadProducts() {
        products = MockData.products
    }
    
    func toggleView() {
        isGridView.toggle()
    }
}
