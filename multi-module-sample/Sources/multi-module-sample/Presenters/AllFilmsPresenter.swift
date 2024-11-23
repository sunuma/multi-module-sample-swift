//
//  AllFilmsPresenter.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/21.
//

import Observation
import Foundation

@MainActor 
protocol AllFilmsPresenterProtocol {
    var films: [SWFilm] { get }
    var selectedFilm: SWFilm? { get set }
    var apiError: APIError? { get }
    var isLoading: Bool { get set }
    var isShowAlert: Bool { get set }
    var isEmptyList: Bool { get }
    
    func onAppear() async
    func tap(film: SWFilm)
}

@Observable
final class AllFilmsPresenter: AllFilmsPresenterProtocol {
    private(set) var films: [SWFilm] = []
    private(set) var apiError: APIError? {
        didSet {
            isShowAlert = apiError != nil
        }
    }
    private(set) var isEmptyList: Bool = false
    var selectedFilm: SWFilm?
    var isLoading: Bool = false
    var isShowAlert: Bool = false
    
    private var repository: APIClientRepository
    
    init(repository: APIClientRepository = APIClientRepositoryImpl()) {
        self.repository = repository
    }
    
    func onAppear() async {
        isLoading = true
        do {
            films = try await repository.allFilms()
            isEmptyList = films.isEmpty
            isLoading = false
        } catch {
            apiError = .getAllFilms
            isLoading = false
        }
    }
    
    func tap(film: SWFilm) {
        selectedFilm = film
    }
    
}
