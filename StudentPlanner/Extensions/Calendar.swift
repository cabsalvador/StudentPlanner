//
//  Calendar.swift
//  StudentPlanner
//
//  Created by Sal on 4/22/22.
//

import Foundation

extension Calendar {
    func getDaysBetween(_ from: Date, _ to: Date) -> Int {
        let start = startOfDay(for: from)
        let end = startOfDay(for: to)
        let numberOfDays = dateComponents([.day], from: start, to: end)
        return numberOfDays.day! + 1
    }
}
