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
                    GeometryReader { g in
                        ScrollView {
                            PlaceHolderView(text: "Sponsored by: Logo image")
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(.white)
                            
                            CircularDottedBarView(progress: CGFloat(viewModel.selectedProductsCount) / CGFloat(viewModel.totalProductsCount), frameWidth: 95, frameHeight: 95)
                                .frame(height: 160)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                SelectableItemsView()
                                ListView(selectedProductsCount: $viewModel.selectedProductsCount, feedResults: feedResults)
                                    .frame(width: g.size.width - 30, height: g.frame(in: .global).size.height, alignment: .center)
                            }
                            .padding(.horizontal, 15)
                            Spacer()
                        }
                        .scrollIndicators(.hidden)
                    }
                    
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
