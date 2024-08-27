//
//  StarsView.swift
//  food-app
//
//  Created by Egor Tushev on 14.08.2024.
//

import SwiftUI

struct StarsView: View {
    
    let rate: String
    
    init(rate: String) {
        self.rate = rate
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text(rate)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .cornerRadius(5)
    }
}
