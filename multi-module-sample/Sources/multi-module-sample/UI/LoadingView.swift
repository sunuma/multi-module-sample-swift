//
//  LoadingView.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/23.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool

    var body: some View {
        ZStack {
            if isLoading {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    ProgressView()
                        .scaleEffect(1.5)
                    Text("読み込み中...")
                        .font(.headline)
                }
                .padding(30)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
            }
        }
    }
}
