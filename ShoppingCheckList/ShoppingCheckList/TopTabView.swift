//
//  TopTabView.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 29/09/24.
//
import SwiftUI

struct CheckListView: View {
    @State var selectedTag: String = "ABC"
    var feedResults: [String] = ["ABC", "xyz", "das", "rwer", "sds", "asda", "ssa", "werwerwe", "werwerwe"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(feedResults, id: \.self) { result in
                    Text(result.capitalized)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor( selectedTag == result ? .appBlue : .appGray)
                        .onTapGesture {
                            selectedTag = result
                        }
                }
            }
            .padding(.top, 10)
            .padding()
        }
        .frame(height: 27)
    }
}
