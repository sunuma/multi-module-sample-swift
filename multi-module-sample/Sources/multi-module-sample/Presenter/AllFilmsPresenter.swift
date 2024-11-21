//
//  AllFilmsPresenter.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/21.
//

import Observation
import Foundation

protocol AllFilmsPresenterProtocol {
    var films: [SWFilm] { get }
    var selectedFilm: SWFilm? { get set }
    var apiError: APIError? { get }
    var isShowAlert: Bool { get set }
    
    @MainActor func getAllFilms()
}

enum APIError: Error, LocalizedError {
    case getAllFilms
    case unknown(String)
    
    var message: String {
        switch self {
        case .getAllFilms:
            return "failed to get all films request."
        case .unknown(let message):
            return message
        }
    }
}

@Observable
final class AllFilmsPresenter: AllFilmsPresenterProtocol {
    private(set) var films: [SWFilm] = []
    private(set) var apiError: APIError? {
        didSet {
            isShowAlert = apiError != nil
        }
    }
    var isShowAlert: Bool = false
    var selectedFilm: SWFilm?
    
    private var client: APIClientProtocol
    
    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }
    
    func getAllFilms() {
        Task {
            do {
                films = try await client.allFilms()
            } catch {
                apiError = .getAllFilms
            }
        }
    }
}
