//
//  ProductCell.swift
//  food-app
//
//  Created by Egor Tushev on 25.08.2024.
//

import SwiftUI

struct ProductCell: View {
    
    let product: Product
    private let isGrid: Bool
    
    init(product: Product, isGrid: Bool) {
        self.product = product
        self.isGrid = isGrid
    }
    
    var body: some View {
        if isGrid {
            productGridCell()
        } else {
            productListCell()
        }
    }
    
    private func productGridCell() -> some View {
        VStack {
            ProductImageView(product, grid: true)
            
            ProductDescriptionView(product: product)
            
            Spacer()
            
            CartView(product: product)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 0.25)
        .frame(width: UIScreen.main.bounds.width / 2 - 15,
               height: (UIScreen.main.bounds.width / 2 - 15) * 1.8)
    }
    
    private func productListCell() -> some View {
        HStack {
            ProductImageView(product, grid: false)
                .cornerRadius(20)
                .padding(5)
                .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2.5)
            
            VStack {
                HStack(spacing: 5) {
                    VStack(spacing: 5) {
                        HStack {
                            StarsView(rate: product.rate)
                                .fixedSize()
                            Text("| 19 отзывов")
                                .font(.caption)
                                .lineLimit(1)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 5)
                        }
                        ProductDescriptionView(product: product)
                    }
                    ActionView()
                        .fixedSize()
                }
                Spacer()
                
                
                CartView(product: product)
            }
        }
        .onTapGesture {}
    }
}
