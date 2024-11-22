//
//  ContentView.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/19.
//

import SwiftUI

public struct ContentView: View {
    @State private var presenter: any AllFilmsPresenterProtocol
    
    public init() {
        _presenter = .init(wrappedValue: AllFilmsPresenter(client: APIClient()))
    }
        
    public var body: some View {
        NavigationStack {
            List(presenter.films, id: \.self) { film in
                Button {
                    presenter.tap(film: film)
                } label: {
                    Text(film.title)
                }
            }
            .navigationTitle("StarWars Titles")
        }
        .task {
            await presenter.onAppear()
        }
        .onAppear(perform: {
            Task {
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
