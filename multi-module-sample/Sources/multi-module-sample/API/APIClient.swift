//
//  APIClient.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/19.
//

@preconcurrency import Apollo
import Foundation

protocol APIClientProtocol: Sendable {
    @discardableResult
    func fetch<Query: GraphQLQuery>(query: Query, resultHandler: GraphQLResultHandler<Query.Data>?) -> (any Cancellable)
}

public actor APIClient: APIClientProtocol {
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

    nonisolated func fetch<Query: GraphQLQuery>(query: Query, resultHandler: GraphQLResultHandler<Query.Data>?) -> (any Cancellable) {
        apollo.fetch(query: query, resultHandler: resultHandler)
    }
}

// ApolloClientはinit以外で変更されないことが保証されているので強引にSendableに準拠させる
// ライブラリ側でSendableに準拠されるようであれば
extension ApolloClient: @unchecked @retroactive Sendable {}

extension ApolloClient {
    static func setup(endpoint: String) -> ApolloClient {
        // setup apollo client
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let client = URLSessionClient()
        let provider = DefaultInterceptorProvider(client: client, store: store)
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: URL(string: endpoint)!
        )
        return ApolloClient(networkTransport: transport, store: store)
    }
}
