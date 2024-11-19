//
//  ContentView.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/19.
//

import SwiftUI

public struct ContentView: View {
    public init() {
        
    }
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
