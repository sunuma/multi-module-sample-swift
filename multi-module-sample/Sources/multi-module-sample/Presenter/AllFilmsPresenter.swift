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
    var selectedFilm: SWFilm?
    var isLoading: Bool = false
    var isShowAlert: Bool = false
    
    private var client: APIClientProtocol
    
    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }
    
    func onAppear() async {
        isLoading = true
        do {
            films = try await client.allFilms()
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
