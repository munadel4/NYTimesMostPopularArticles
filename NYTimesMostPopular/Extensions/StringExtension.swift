//
//  StringExtension.swift
//  NYTimesMostPopular
//
//  Created by Munadel Qubbaj on 10/1/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import Foundation

extension String {

    public func convertStringDateFormat() -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        guard let date = dateFormatter.date(from: self) else {
            return self
        }
        let calendar = Calendar.init(identifier: .iso8601)
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
        let finalDate = calendar.date(from: components)
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        guard let finalDateFormatted = finalDate else {
            return self
        }
        let finalStringDate = dateFormatter.string(from: finalDateFormatted)
        return finalStringDate
    }

}
