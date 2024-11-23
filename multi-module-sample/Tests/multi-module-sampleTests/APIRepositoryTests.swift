//
//  APIRepositoryTests.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/22.
//

import Testing
@testable import multi_module_sample

actor APIRepositoryTests {
    
    @MainActor
    @Test func testAllFilms() async throws {
        let repository = APIClientRepositoryImpl()
        let films = try await repository.allFilms()
        #expect(!films.isEmpty)
    }
    
}
