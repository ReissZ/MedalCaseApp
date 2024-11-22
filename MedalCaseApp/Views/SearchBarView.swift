//
//  SearchBarView.swift
//  MedalCaseApp
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool // Use FocusState instead of @State

    var body: some View {
        HStack {
            TextField("Search medals...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color("BackgroundGray"))
                .cornerRadius(8)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .focused($isFocused)
                .onAppear {
                    isFocused = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 16)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    SearchBarView(text: .constant(""))
}
