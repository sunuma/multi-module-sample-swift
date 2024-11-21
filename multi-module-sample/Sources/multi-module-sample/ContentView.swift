//
//  ContentView.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/19.
//

import SwiftUI

public struct ContentView: View {
    @State private var presenter: AllFilmsPresenterProtocol
    
    public init() {
        _presenter = .init(wrappedValue: AllFilmsPresenter(client: APIClient()))
    }
        
    public var body: some View {
        NavigationStack {
            List(presenter.films, id: \.self) { film in
                Button {
                    presenter.selectedFilm = film
                } label: {
                    Text(film.title)
                }
            }
            .navigationTitle("StarWars Titles")
        }
        .onAppear(perform: {
            Task {
                presenter.getAllFilms()
            }
        })
        .sheet(item: $presenter.selectedFilm) { film in
            Text(film.title)
        }
        .alert(isPresented: $presenter.isShowAlert, error: presenter.apiError) {
            Button("Close") {}
        }
    }
}

#Preview {
    ContentView()
}
