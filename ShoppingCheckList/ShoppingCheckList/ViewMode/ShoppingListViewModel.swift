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
    var cancellables = Set<AnyCancellable>()
    @Published var selectedProduct: Set<Int>?
    
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
            })
            .store(in: &cancellables)
    }

}
