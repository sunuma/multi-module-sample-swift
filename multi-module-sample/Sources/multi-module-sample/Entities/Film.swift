//
//  Film.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/21.
//

import Foundation

struct SWFilm: Hashable, Identifiable {
    let id = UUID()
    let title: String
}

extension SW.AllTitlesQuery.Data.AllFilms.Film {
    func convertTo() -> SWFilm {
        SWFilm(title: title ?? "")
    }
}
