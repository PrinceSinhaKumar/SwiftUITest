//
//  ShoppingListViewModel.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 28/09/24.
//

import Foundation
import Combine

class ShoppingListViewModel: ObservableObject {
    
    @Published var shoppingList: ShoppingList?
    @Published var error: ErrorHandler?
    @Published var selectedProductsCount: Int = 0
    @Published var totalProductsCount: Int = 0
    var cancellables = Set<AnyCancellable>()
    
    let model: ShppingListModel
    
    init(model: ShppingListModel) {
        self.model = model
    }
    
    func fetchShoppingList() {
        model.fetchListData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {[weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.error = error
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] listData in
                self?.shoppingList = listData
                
                // Assuming you have a way to determine the total number of products
                self?.totalProductsCount = listData.shoppingData?.contentFeed?.feedResults?.reduce(0, { $0 + ($1.artifact?.slideShow?.slides?.count ?? 0) }) ?? 0
            })
            .store(in: &cancellables)
    }
}

