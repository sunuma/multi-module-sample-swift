//
//  APIClient.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/19.
//

import Apollo
import Foundation

public final class APIClient {
    private let apollo: ApolloClient
    
    public init(endpoint: String = "https://swapi-graphql.netlify.app/.netlify/functions/index") {
        // setup apollo client
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let client = URLSessionClient()
        let provider = DefaultInterceptorProvider(client: client, store: store)
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: URL(string: endpoint)!
        )
        apollo = ApolloClient(networkTransport: transport, store: store)
    }
    
    @MainActor
    func allFilms() async throws -> [SWFilm] {
        try await withCheckedThrowingContinuation { continution in
            apollo.fetch(query: SW.AllTitlesQuery()) { result in
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
