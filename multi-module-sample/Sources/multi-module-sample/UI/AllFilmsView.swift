//
//  AllFilmsView.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/23.
//

import SwiftUI

struct AllFilmsView: View {
    @State private var presenter: any AllFilmsPresenterProtocol

    init(presenter: AllFilmsPresenterProtocol = AllFilmsPresenter()) {
        _presenter = .init(wrappedValue: presenter)
    }

    public var body: some View {
        NavigationStack {
            Group {
                if presenter.isEmptyList {
                    EmptyView(emptyMessage: "No Result For SW Titles.")
                } else {
                    List(presenter.films, id: \.self) { film in
                        Button {
                            presenter.tap(film: film)
                        } label: {
                            Text(film.title)
                        }
                    }
                }
            }
            .navigationTitle("StarWars Titles")
        }
        .task {
            await presenter.onAppear()
        }
        .sheet(item: $presenter.selectedFilm) { film in
            DetailView(film: film)
        }
        .alert(isPresented: $presenter.isShowAlert, error: presenter.apiError) {
            Button("Close") {}
        }
        .overlay {
            LoadingView(isLoading: $presenter.isLoading)
        }
    }
}

#Preview("Actual") {
    AllFilmsView()
}

#Preview("Mock") {
    AllFilmsView(
        presenter: AllFilmsPresenter(
            repository: MockAllFilmsRepositoryImpl(
                films: [
                    SWFilm(title: "帝国の逆襲"),
                    SWFilm(title: "フォースの覚醒"),
                ]
            )
        )
    )
}

#Preview("Empty") {
    AllFilmsView(
        presenter: AllFilmsPresenter(
            repository: MockAllFilmsRepositoryImpl()
        )
    )
}
