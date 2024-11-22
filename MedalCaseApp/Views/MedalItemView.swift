//
//  MedalItemView.swift
//  MedalCaseApp
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import SwiftUI

struct MedalItemView: View {
    let medal: Medal

    var isCompleted: Bool {
        medal.subtitle != "Not Yet"
    }

    var body: some View {
        NavigationLink(destination: MedalDetailsView(medal: medal)) {
            VStack {
                // Medal Image
                Image(medal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .opacity(isCompleted ? 1.0 : 0.4)

                // Medal Title
                Text(medal.title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(isCompleted ? Color("BlackText") : Color.gray)

                // Medal Subtitle
                Text(medal.subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(isCompleted ? Color("BlackText") : Color.gray)
            }
            .padding(.vertical, 8)
        }
    }
}

struct MedalItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Completed medal
            NavigationView {
                MedalItemView(medal: Medal(imageName: "fastest_5k", title: "Fastest 5K", subtitle: "00:00"))
                    .previewDisplayName("Completed Medal")
            }

            // Incomplete medal
            NavigationView {
                MedalItemView(medal: Medal(imageName: "fastest_marathon", title: "Fastest Marathon", subtitle: "Not Yet"))
                    .previewDisplayName("Incomplete Medal")
            }
        }
        .previewLayout(.sizeThatFits)
    }
}


