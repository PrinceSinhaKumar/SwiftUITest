//
//  ErrorHandler.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 28/09/24.
//
import Foundation

enum ErrorHandler: Error {
    
    case fileNotAvailable
    case missingValue
    case error
    
    var message: String {
        switch self {
        case .fileNotAvailable:
            "File not avaible"
        case .missingValue:
            "Missing value"
        case .error:
            self.localizedDescription
        }
    }
}
