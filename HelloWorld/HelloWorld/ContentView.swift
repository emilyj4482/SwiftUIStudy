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
    
    @State var imageHeight: Double = 0.0
    @State var textHeight: Double = 0.0
    
    @State var isTextHigher: Bool = false
    
    var body: some View {
        HStack(alignment: isTextHigher ? .center : .top, spacing: 20) {
            
            ImageView()
                .overlay {
                    GeometryReader { geometry in
                        Color.clear.onAppear {
                            print(geometry.size.height)
                            imageHeight = geometry.size.height
                            isTextHigher = textHeight > imageHeight
                            print(isTextHigher)
                        }
                    }
                }
            
            TextView(helloCount: textCounts.0, worldCount: textCounts.1)
                .overlay {
                    GeometryReader { geometry in
                        Color.clear.onAppear {
                            print(geometry.size.height)
                            textHeight = geometry.size.height
                            isTextHigher = textHeight > imageHeight
                            print(isTextHigher)
                        }
                    }
                }
        }
        .padding(.leading, 16)
        .padding([.top, .bottom], isTextHigher ? 10 : 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.yellow)
    }
    
}

struct ImageView: View {
    var body: some View {
        Image(systemName: "message.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
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
