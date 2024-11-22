//
//  AboutDeveloperView.swift
//  MedalCaseApp
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import SwiftUI

struct AboutDeveloperView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Text("About the Developer")
                .font(.headline)

            Text("This app was developed by Reiss Zurbyk.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Tappable Phone Link
            Link("📞 905-774-1878", destination: URL(string: "tel:9057741878")!)
                .font(.body)
                .foregroundColor(.blue)

            // Tappable Email Link
            Link("📧 reisszurbyk@live.ca", destination: URL(string: "mailto:reisszurbyk@live.ca")!)
                .font(.body)
                .foregroundColor(.blue)

            Spacer()

            Button(action: {
                dismiss()
            }) {
                Text("Close")
                    .font(.body)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .presentationDetents([.medium])
    }
}


#Preview {
    AboutDeveloperView()
}
