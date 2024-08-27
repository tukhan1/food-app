//
//  CartView.swift
//  food-app
//
//  Created by Egor Tushev on 19.08.2024.
//

import SwiftUI

struct CartView: View {
    
    let product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        
        if cartManager.quantity(for: product) > 0 {
            VStack {
                if product.kgInUnit != nil {
                    Picker("Единица измерения", selection: Binding(
                        get: { cartManager.unit(for: product) },
                        set: { newUnit in
                            cartManager.changeUnit(for: product)
                        }
                    )) {
                        Text("Шт").tag("Шт")
                        Text("Кг").tag("Кг")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                HStack {
                    Button(action: {
                        if cartManager.quantity(for: product) > (cartManager.unit(for: product) == "Шт" ? 1 : 0.1) {
                            cartManager.decreaseQuantity(for: product)
                        } else {
                            cartManager.removeFromCart(product)
                        }
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .background(Color.green)
                            .padding()
                    }
                    .zIndex(2)
                    
                    
                    Spacer()
                    
                    VStack {
                        Text("\(cartManager.quantity(for: product), specifier: cartManager.unit(for: product) == "Шт" ? "%.0f" : "%.1f") \(cartManager.unit(for: product).lowercased())")
                            .font(.headline)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .scaledToFit()
                            .minimumScaleFactor(0.6)
                        
                        Text("~\(cartManager.totalPrice(for: product), specifier: "%.2f") Р")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .scaledToFit()
                            .minimumScaleFactor(0.6)
                    }
                    .zIndex(1)
                    
                    Spacer()
                    
                    Button(action: {
                        cartManager.increaseQuantity(for: product)
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .background(Color.green)
                            .padding()
                    }
                    .zIndex(2)
                    
                }
                .background(Color.green)
                .cornerRadius(20)
            }
            .padding(5)
        } else {
            HStack {
                VStack(alignment: .leading) {
                    Text(String(format: "%.2f", product.price) + " Р")
                        .font(.body)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    Text(String(format: "%.2f", product.priceWithoutSale))
                        .font(.caption)
                        .strikethrough(true, color: .gray)
                        .foregroundColor(.gray)
                }
                .zIndex(1)
                
                Spacer()
                
                Button(action: {
                    cartManager.addToCart(product, quantity: 1, unit: "Шт")
                }) {
                    Image(systemName: "basket.fill")
                        .foregroundColor(.white)
                        .background(Color.green)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(20)
                }
                .zIndex(2)
            }
            .padding(5)
        }
    }
}
