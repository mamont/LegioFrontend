//
//  NetworkError.swift
//  Legio
//
//  Created by Mac on 01.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decodableError
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodableError:
            return NSLocalizedString("Некорректный ответ от сервера", comment: "Incorrect network response")
        }
    }
}
