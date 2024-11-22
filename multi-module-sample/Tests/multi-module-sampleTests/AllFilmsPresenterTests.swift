//
//  AllFilmsPresenterTests.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/21.
//

import Testing
@testable import multi_module_sample

actor AllFilmsPresenterTests {
    
    @MainActor
    @Test func testAppear() async throws {
        let presenter: AllFilmsPresenterProtocol = AllFilmsPresenter()
        #expect(presenter.films.isEmpty)
        await presenter.onAppear()
        #expect(!presenter.films.isEmpty)
    }
 
    @MainActor
    @Test func testTap() async throws {
        let film: SWFilm = SWFilm(title: "The Force Awakens")
        let presenter: AllFilmsPresenterProtocol = AllFilmsPresenter()
        #expect(presenter.selectedFilm == nil)
        presenter.tap(film: film)
        #expect(presenter.selectedFilm == film)
    }
}
