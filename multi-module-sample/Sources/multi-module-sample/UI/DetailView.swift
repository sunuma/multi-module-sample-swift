//
//  DetailView.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/23.
//

import SwiftUI

struct DetailView: View {
    var film: SWFilm

    var body: some View {
        VStack {
            Text(film.title)
                .font(.title)
            Divider()
            Spacer()
        }
        .padding(.top, 10)
    }
}
