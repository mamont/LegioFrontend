//
//  DateTimeConverter.swift
//  Legio
//
//  Created by Mac on 26.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

class DateStringConverter {
    
    private enum DateFormat {
        static let input: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        static let output: String = "dd.MM.yyyy HH:mm"
    }
    
    private enum Constants {
        static let defaultDate: String = ""
    }
    
    static func convert(input: String) -> String {
        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = DateFormat.input
        if let date = formatter.date(from: input) {
            formatter.dateFormat = DateFormat.output
            return formatter.string(from: date)
            
        } else {
            return Constants.defaultDate
        }
    }
}
