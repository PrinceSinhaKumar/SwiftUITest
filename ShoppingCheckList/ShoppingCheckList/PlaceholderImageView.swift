//
//  PlaceholderImageView.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 29/09/24.
//
import SwiftUI

struct PlaceHolderView: View {
    var text: String = ""
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 12))
                .padding()
        }
    }
}

struct SelectableItemsView: View {
    @State var selectedItem: String =  "Items I have"
    var items: [String] = ["Items I have", "Items I need"]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    HStack(alignment: .center) {
                        Text(item)
                            .foregroundStyle(.appBlue)
                            .font(.system(size: 14))
                            .fontWeight(selectedItem == item ? .semibold : .regular)
                            .onTapGesture {
                                self.selectedItem = item
                            }
                    }
                    .padding()
                    .frame(height: 30)
                    .background(selectedItem == item ? .app2NdSkyBlue : .white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke((selectedItem == item ? .white : .appBlue), lineWidth: 1)
                    )
                }
            }
        }
    }
}

struct ArticleCardView: View {
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 60)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Related articles")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Insert Article Title\nHere →")
                        .font(.headline)
                        .foregroundColor(.appBlue)
                    
                }
            }
            
            Spacer()
            
        }
        .frame(height: 80)
        .background(.footerBack)
        .cornerRadius(10)
        .shadow(color: .footerBorder, radius: 1)
        .padding(.horizontal, 1)
        .padding(.bottom, 25)
    }
}
