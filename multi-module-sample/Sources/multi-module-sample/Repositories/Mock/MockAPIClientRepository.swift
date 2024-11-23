//
//  MockAPIClientRepository.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/23.
//

actor MockAPIClientRepositoryImpl: APIClientRepository {
    
    private let films: [SWFilm]
    
    init(films: [SWFilm] = []) {
        self.films = films
    }
    
    func allFilms() async throws -> [SWFilm] {
        films
    }
    
}
