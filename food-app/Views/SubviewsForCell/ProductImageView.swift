//
//  ProductImageView.swift
//  food-app
//
//  Created by Egor Tushev on 14.08.2024.
//

import SwiftUI

struct ProductImageView: View {
    
    let product: Product
    let grid: Bool
    
    init(_ product: Product, grid: Bool) {
        self.product = product
        self.grid = grid
    }
    
    var body: some View {
        ZStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            if let category = product.category {
                VStack {
                    HStack {
                        Text(category)
                            .font(.caption2)
                            .scaledToFit()
                            .minimumScaleFactor(0.6)
                            .offset(x: 8)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .foregroundColor(.white)
                            .background(Color("categoryColor"))
                            .cornerRadius(10)
                            .offset(x: -10)
                            .clipped()
                        Spacer()
                    }
                    Spacer()
                }
            }
            
            if grid {
                ActionView()
                VStack {
                    Spacer()
                    StarsView(rate: product.rate)
                }
            }
            
            if let sale = product.sale {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("\(sale)%")
                            .font(.headline)
                            .foregroundStyle(.red)
                            .padding(.trailing, 5)
                    }
                }
            }
        }
    }
}

#Preview {
    ProductImageView(MockData.sampleProduct, grid: true)
}
