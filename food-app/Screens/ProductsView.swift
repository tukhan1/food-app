//
//  FoodView.swift
//  food-app
//
//  Created by Egor Tushev on 19.08.2024.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject private var viewModel = FoodViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isGridView {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 10) {
                            ForEach(viewModel.products) {
                                ProductGridCell(product: $0)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                    .frame(width: UIScreen.main.bounds.width / 2 - 15,
                                           height: (UIScreen.main.bounds.width / 2 - 15) * 1.8)
                            }
                        }
                        .padding(10)
                    }
                } else {
                    ZStack {
                        NavigationView {
                            List(viewModel.products) { product in
                                ProductListCell(product: product)
                            }
                            .listStyle(.plain)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        viewModel.toggleView()
                    }) {
                        Image(systemName: viewModel.isGridView ? "rectangle.grid.2x2" : "rectangle.split.3x3")
                            .imageScale(.medium)
                            .foregroundColor(.green)
                            .padding(10)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
        }
    }
}

#Preview {
    ProductsView()
}
