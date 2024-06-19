//
//  DayNumber.swift
//
//
//  Created by Erik Schnell on 19.06.2024.
//

import Foundation

func dayNumber() -> Int {
    let calendar = Calendar.current
    let today = Date()
    let dayOfWeek = calendar.component(.weekday, from: today)
    
    switch dayOfWeek {
    case 2: // Monday
        return 0
    case 3: // Tuesday
        return 1
    case 4: // Wednesday
        return 2
    case 5: // Thursday
        return 3
    case 6: // Friday
        return 4
    case 7, 1: // Saturday, Sunday
        return 0
    default:
        return 0
    }
}
