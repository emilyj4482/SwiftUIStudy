//
//  ContentView.swift
//  HelloWorld
//
//  Created by EMILY on 09/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            YellowView(textCounts: (1, 1))
            
            YellowView(textCounts: (3, 2))
        }
    }
}

struct YellowView: View {
    let textCounts: (Int, Int)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "message.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
            TextView(helloCount: textCounts.0, worldCount: textCounts.1)
        }
        .padding(.leading, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.yellow)
    }
}

struct TextView: View {
    let helloCount: Int
    let worldCount: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                ForEach(0..<helloCount, id: \.self) { _ in
                    Text("Hello")
                        .foregroundStyle(.blue)
                }
            }
            
            VStack {
                ForEach(0..<worldCount, id: \.self) { _ in
                    Text("World")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
