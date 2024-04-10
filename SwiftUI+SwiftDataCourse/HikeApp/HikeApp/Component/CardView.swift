//
//  CardView.swift
//  HikeApp
//
//  Created by Terrell Payne on 1/19/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        //MARK: - CARD
        ZStack {
            CustomBackgroundView()
            
            ZStack {
                Circle()
                    .fill(
                    LinearGradient(
                        colors: [Color("ColorIndigoMedium"), Color("ColorGreenDark")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    ).frame(width: 256, height: 256)   
                
                Image("image-1")
                    .resizable()
                .scaledToFit()
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
