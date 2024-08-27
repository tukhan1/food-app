//
//  ActionView.swift
//  food-app
//
//  Created by Egor Tushev on 19.08.2024.
//

import SwiftUI

struct ActionView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack(spacing: 15) {
                    Image("orderList")
                    Image("heart")
                }
                .frame(width: 32, height: 64)
                .background(.white)
                .opacity(0.8)
                .cornerRadius(50)
                .offset(x: -5)
            }
            Spacer()
        }
    }
}

#Preview {
    ActionView()
}
