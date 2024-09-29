//
//  ContentView.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 28/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ShoppingListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if let feedResults = viewModel.shoppingList?.shoppingData?.contentFeed?.feedResults {
                    CheckListView()
                    PlaceHolderView(text: "Sponsored by: Logo image")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        ListView(selectedProductsCount: $viewModel.selectedProductsCount, totalProductsCount: $viewModel.totalProductsCount, feedResults: feedResults)
                    }
                    .padding(.horizontal, 15)
                }
            }
            .background(.appGrayBackground)
            .task {
                viewModel.fetchShoppingList()
            }
            .navigationSetup("Checklist")
        }
    }
}

#Preview {
    ContentView(viewModel: ShoppingListViewModel(model: ShppingListModel(parsable: JSONParsable())))
}
