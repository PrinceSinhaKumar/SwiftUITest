//
//  ListView.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 29/09/24.
//

import SwiftUI

struct ListView: View {
    @Binding var selectedProductsCount: Int
    @Binding var totalProductsCount: Int
    let feedResults: [FeedResults]
    
    var body: some View {
        List {
            Section {} header: {
                VStack(alignment: .leading, spacing: 35) {
                    HStack {
                        Spacer()
                        CircularDottedBarView(progress: CGFloat(selectedProductsCount) / CGFloat(totalProductsCount), frameWidth: 95, frameHeight: 95)
                        Spacer()
                    }
                    SelectableItemsView()

                }
                .listRowInsets(EdgeInsets())
                .padding(.top, 30)
                .padding(.bottom, 27)
            }
            
            ForEach(feedResults, id: \.id) { result in
                if let category = result.artifact?.slideShow?.slides, !category.isEmpty {
                    let rowData = category.filter({$0.retailers?.count ?? 0 > 0})
                    Section {
                        rowView(category: rowData)
                    } header: {
                        if !rowData.isEmpty {
                            headerView(result: result)
                        }
                    } footer: {
                        if category.last?.retailers?.isEmpty ?? false {
                            VStack(spacing: 25) {
                                footerView(rowData: rowData)
                                if !rowData.isEmpty {
                                    ArticleCardView()
                                }
                            }
                            
                        }
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
        }
        .listSectionSpacing(0)
        .listStyle(.grouped)
        .scrollIndicators(.hidden)
    }
    
}
extension ListView {
    fileprivate func rowView(category: [Slides]) -> ForEach<Range<Array<Slides>.Index>, Array<Slides>.Index, some View> {
        return ForEach(category.indices, id: \.self) { index in
            let result = category[index]
            VStack {
                ProductRow(selectedCount: $selectedProductsCount, products: result) // Pass the binding
                    .padding()
                    .frame(height: 25)
                    .padding([.top])
            }
            .listRowSpacing(0)
            .listRowSeparator(.hidden)
            .listSectionSeparator(.hidden)
            .background(.white)
            .padding(.bottom, index == category.count - 1 ? 20 : 0)
            .listRowBackground(
                Color.white.cornerRadius(index == category.count - 1 ? 10 : 0)
            )
        }
    }
    
    fileprivate func headerView(result: FeedResults) -> some View {
        return VStack(alignment: .leading) {
            Text(result.tags?.first?.capitalized ?? "")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.headline)
        .foregroundColor(.white)
        .padding(.horizontal, 10)
        .frame(height: 47)
        .background(
            Color(.appListHeader)
                .cornerRadius(10, corners: [.topLeft, .topRight])
        )
    }
    
    fileprivate func footerView(rowData: [Slides]) -> some View {
        return PlaceHolderView(text: "320x50 Ad placeholder")
            .frame(height: rowData.isEmpty ? 250 : 50)
            .frame(maxWidth: .infinity)
            .background(.appImagePlacehold)
            .padding(.horizontal)
            .padding(.top, 25)
            .foregroundStyle(.black)
    }
}
