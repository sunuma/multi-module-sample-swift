//
//  APIError.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/21.
//

import Foundation

public enum APIError: Error, LocalizedError {
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
