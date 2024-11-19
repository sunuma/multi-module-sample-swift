//
//  APIClient.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/19.
//

import Apollo
import Foundation

@MainActor
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
    
    func allTitles() async throws -> [String] {
        try await withCheckedThrowingContinuation({ continution in
            apollo.fetch(query: SW.AllTitlesQuery()) { result in
                switch result {
                case .success(let val):
                    let titles = val.data?.allFilms?.films?.compactMap({ film in
                        film?.title
                    })
                    continution.resume(returning: titles ?? [])
                    
                case .failure(let error):
                    continution.resume(throwing: error)
                }
            }
        })
    }
}
