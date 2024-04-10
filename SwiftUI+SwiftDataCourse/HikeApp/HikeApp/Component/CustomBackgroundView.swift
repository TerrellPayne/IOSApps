//
//  CustomBackgroundView.swift
//  HikeApp
//
//  Created by Terrell Payne on 1/19/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            //MARK: - 3. DEPTH
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            //MARK: - 2. LIGHT
            
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 30)
                .opacity(0.85)
            
            //MARK: - 1. SURFACE
            
            LinearGradient(
                colors: [.customGreenLight, .colorGreenMedium], startPoint: .top, endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding(10)
}
