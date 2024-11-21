//
//  ContentView.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/19.
//

import SwiftUI

public struct ContentView: View {
    private var client = APIClient()
        
    @State private var films: [SWFilm] = []
    @State private var selectedFilm: SWFilm?
    
    public init() {
        
    }
        
    public var body: some View {
        NavigationStack {
            List(films, id: \.self) { film in
                Button {
                    selectedFilm = film
                } label: {
                    Text(film.title)
                }
            }
            .navigationTitle("StarWars Titles")
        }
        .onAppear(perform: {
            Task {
                films = try await client.allFilms()
            }
        })
        .sheet(item: $selectedFilm) { film in
            Text(film.title)
        }
    }
}

#Preview {
    ContentView()
}
