//
//  ShppingListModel.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 28/09/24.
//

import Foundation
import Combine

protocol JSONParsableDelegate {
    func parseJsonData<T: Decodable>(_ jsonData: Data, type: T.Type) -> AnyPublisher<T, ErrorHandler>
}

class JSONParsable: JSONParsableDelegate {
    
    func parseJsonData<T: Decodable>(_ jsonData: Data, type: T.Type) -> AnyPublisher<T, ErrorHandler> {
        return Future<T, ErrorHandler> { promise in
            let decoder = JSONDecoder()
            do {
                let listData = try decoder.decode(T.self, from: jsonData)
                promise(.success(listData))
            } catch {
                promise(.failure(.error))
            }
        }
        .eraseToAnyPublisher()
    }
}

class ShppingListModel {
    
    private let parsable: JSONParsableDelegate
    init(parsable: JSONParsableDelegate) {
        self.parsable = parsable
    }
    
    func fetchListData() -> AnyPublisher<ShoppingList, ErrorHandler> {
        return Future<Data, ErrorHandler> { promise in
                if let jsonString = Bundle.main.path(forResource: "ShoppingJson", ofType: "json"),
                   let jsonData = try? String(contentsOfFile: jsonString, encoding: .utf8).data(using: .utf8) {
                    promise(.success(jsonData))
                } else {
                    promise(.failure(ErrorHandler.fileNotAvailable))
                }
            }
            .flatMap { jsonData in
                self.parsable.parseJsonData(jsonData, type: ShoppingList.self)
            }
            .eraseToAnyPublisher()
        }
       
//        func fetchAndSubscribe() {
//            fetchListData()
//                .receive(on: DispatchQueue.main)
//                .sink(receiveCompletion: { completion in
//                    switch completion {
//                    case .failure(let error):
//                        print("Error: \(error.localizedDescription)")
//                    case .finished:
//                        break
//                    }
//                }, receiveValue: { [weak self] listData in
//                    //self?.listItem = listData
//                    print(listData)
//                })
//                .store(in: &cancellables)
//        }
}
