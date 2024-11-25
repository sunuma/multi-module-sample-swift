//
//  AllFilmsRepositoryTests.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/22.
//

@testable import multi_module_sample
import Testing

actor APIRepositoryTests {
    @MainActor
    @Test func testAllFilms() async throws {
        let repository = AllFilmsRepositoryImpl()
        let films = try await repository.fetch()
        #expect(!films.isEmpty)
    }

    @MainActor
    @Test func testMockEmptyFilms() async throws {
        let repository = MockAllFilmsRepositoryImpl()
        let films = try await repository.fetch()
        #expect(films.isEmpty)
    }

    @MainActor
    @Test func testMockAddFilms() async throws {
        let repository = MockAllFilmsRepositoryImpl(
            films: [
                SWFilm(title: "帝国の逆襲"),
            ]
        )
        let films = try await repository.fetch()
        #expect(films.count == 1)
        #expect(films.first?.title == "帝国の逆襲")
    }
}
