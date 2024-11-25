//
//  MockAPIClientRepository.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/23.
//

actor MockAllFilmsRepositoryImpl: AllFilmsRepository {
    private let films: [SWFilm]

    init(films: [SWFilm] = []) {
        self.films = films
    }

    func fetch() async throws -> [SWFilm] {
        films
    }
}
