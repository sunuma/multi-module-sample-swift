//
//  EmptyView.swift
//  multi-module-sample
//
//  Created by Shin Unuma on 2024/11/23.
//

import SwiftUI

struct EmptyView: View {
    var emptyMessage: String = ""
    
    var body: some View {
        VStack {
            Text(emptyMessage)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.top, 50)
            Spacer()
        }
    }
}
