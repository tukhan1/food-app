//
//  ProductDescriptionView.swift
//  food-app
//
//  Created by Egor Tushev on 19.08.2024.
//

import SwiftUI

struct ProductDescriptionView: View {
    
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        VStack {
            Text(product.name)
                .font(.caption)
                .lineLimit(2)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 5)
            
            if let countryName = product.countryName {
                Text("\(countryName) 🇫🇷")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 5)
            }
        }
    }
}
