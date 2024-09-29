//
//  ShoppingCheckListApp.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 28/09/24.
//

import SwiftUI

@main
struct ShoppingCheckListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ShoppingListViewModel(model: ShppingListModel(parsable: JSONParsable())))
        }
    }
}
