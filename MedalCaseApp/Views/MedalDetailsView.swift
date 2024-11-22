//
//  MedalDetailsView.swift
//  MedalCaseApp
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import SwiftUI

struct MedalDetailsView: View {
    let medal: Medal
    @Environment(\.dismiss) var dismiss

    var isCompleted: Bool {
        medal.subtitle != "Not Yet"
    }

    var body: some View {
        VStack(spacing: 16) {
            // Medal Image
            Image(medal.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150) // Larger image
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .opacity(isCompleted ? 1.0 : 0.4) // Dim if not completed

            // Medal Title
            Text(medal.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(isCompleted ? Color("BlackText") : Color.gray)

            // Completion Status
            Text(isCompleted ? "Completed" : "Not Yet")
                .font(.system(size: 16))
                .foregroundColor(isCompleted ? Color("BlackText") : Color("LightGrayText"))

            // Description or Additional Info
            Text(isCompleted ? "Way to go earning your \(medal.title) achievement!" : "Ready for your first \(medal.title)!")
                .font(.system(size: 14))
                .foregroundColor(Color("DarkGrayText"))
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Medal Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss() // Navigate back
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationView {
        MedalDetailsView(medal: Medal(imageName: "fastest_5k", title: "Fastest 5K", subtitle: "00:00"))
    }
}
