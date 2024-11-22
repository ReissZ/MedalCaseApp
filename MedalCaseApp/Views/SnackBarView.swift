//
//  SnackBarView.swift
//  MedalCaseApp
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import SwiftUI

struct SnackBarView: View {
    let message: String

    var body: some View {
        Text(message)
            .font(.system(size: 14))
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.8))
            .cornerRadius(8)
            .shadow(radius: 5)
            .padding(.horizontal, 16)
    }
}

#Preview {
    SnackBarView(message: "Reset functionality triggered successfully!")
}
