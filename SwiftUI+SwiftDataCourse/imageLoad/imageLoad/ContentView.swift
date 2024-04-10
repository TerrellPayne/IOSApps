//
//  ContentView.swift
//  imageLoad
//
//  Created by Terrell Payne on 1/17/24.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128).foregroundColor(.purple).opacity(0.5)
        
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        // 1. Basic
        // AsyncImage(url: URL(string: imageURL))
        
        // 2. Scale
        // AsyncImage(url: URL(string: imageURL),scale: 3.0)
        
        // 3. Placeholder
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image.imageModifier()
//             
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//    }
//        .padding(40)
        
        // 4. Phase
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//                    
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//            
//        }
        
        //  5. Animation
        
        AsyncImage( url: URL(string: imageURL), transaction: Transaction(animation:
                .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
                .padding(40)
    }
      
}

#Preview {
    ContentView()
}
