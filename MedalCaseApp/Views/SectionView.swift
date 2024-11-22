//
//  SectionView.swift
//  MedalCaseApp
//
//  Created by Reiss Zurbyk on 2024-11-22.
//

import SwiftUI

struct SectionView: View {
    let title: String
    let items: [Medal]
    var completedCount: Int? = nil
    var totalCount: Int? = nil

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack(alignment: .leading) {
            // Subheader with title and counter
            HStack {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("BlackText"))

                Spacer()

                if let completedCount = completedCount, let totalCount = totalCount {
                    Text("\(completedCount) of \(totalCount)")
                        .font(.system(size: 14))
                        .foregroundColor(Color("LightGrayText"))
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("BackgroundGray"))

            // Medal grid
            LazyVGrid(columns: columns) {
                ForEach(items) { item in
                    MedalItemView(medal: item)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
        }
        .cornerRadius(8)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(
            title: "Personal Records",
            items: [
                Medal(imageName: "fastest_5k", title: "Fastest 5K", subtitle: "00:00"),
                Medal(imageName: "longest_run", title: "Longest Run", subtitle: "01:15:00")
            ]
        )
    }
}

