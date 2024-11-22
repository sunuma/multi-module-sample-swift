//
//  APIClientRepository.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/22.
//

protocol APIClientRepository: Sendable {
    func allFilms() async throws -> [SWFilm]
}

actor APIClientRepositoryImpl: APIClientRepository {
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func allFilms() async throws -> [SWFilm] {
        try await withCheckedThrowingContinuation { continution in
            apiClient.fetch(query: SW.AllTitlesQuery()) { result in
                switch result {
                case .success(let val):
                    let films = val.data?.allFilms?.films?.compactMap { $0?.convertTo() } ?? []
                    continution.resume(returning: films)
                    
                case .failure(let error):
                    continution.resume(throwing: error)
                }
            }
        }
    }
    
}
