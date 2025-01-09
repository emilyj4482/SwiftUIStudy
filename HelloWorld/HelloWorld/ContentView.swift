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
            YellowView()
            
            YellowView()
        }
    }
}

struct YellowView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "message.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
            TextView()
        }
        .padding(.leading, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.yellow)
    }
}

struct TextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Hello")
            
            Text("World")
        }
    }
}

#Preview {
    ContentView()
}
