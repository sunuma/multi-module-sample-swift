//
//  ContentView.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/19.
//

import SwiftUI

public struct ContentView: View {
    private var client = APIClient()
        
    @State private var titles: [String] = []
    
    public init() {
        
    }
        
    public var body: some View {
        List(titles, id: \.self) { title in
            Text(title)
        }
        .onAppear(perform: {
            Task {
                titles = try await client.allTitles()
            }
        })
        .navigationTitle("SW Titles")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
