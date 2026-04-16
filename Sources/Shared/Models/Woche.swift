//
//  Woche.swift
//
//
//  Created by Erik Schnell on 03.06.2024.
//

import Foundation

public struct Woche: Codable, Sendable {
    public var montag: Tag
    public var dienstag: Tag
    public var mittwoch: Tag
    public var donnerstag: Tag
    public var freitag: Tag
    
    public init(montag: Tag, dienstag: Tag, mittwoch: Tag, donnerstag: Tag, freitag: Tag) {
        self.montag = montag
        self.dienstag = dienstag
        self.mittwoch = mittwoch
        self.donnerstag = donnerstag
        self.freitag = freitag
    }

    public func tag(for wochentag: Wochentag) -> Tag {
        switch wochentag {
        case .montag:
            montag
        case .dienstag:
            dienstag
        case .mittwoch:
            mittwoch
        case .donnerstag:
            donnerstag
        case .freitag:
            freitag
        }
    }
}

public struct Tag: Codable, Sendable {
    public var morgentisch: AnmeldeStatus
    public var mittagstisch: AnmeldeStatus
    public var nachmittagsbetreuung1: AnmeldeStatus
    public var nachmittagsbetreuung2: AnmeldeStatus
    
    public init(morgentisch: AnmeldeStatus, mittagstisch: AnmeldeStatus, nachmittagsbetreuung1: AnmeldeStatus, nachmittagsbetreuung2: AnmeldeStatus) {
        self.morgentisch = morgentisch
        self.mittagstisch = mittagstisch
        self.nachmittagsbetreuung1 = nachmittagsbetreuung1
        self.nachmittagsbetreuung2 = nachmittagsbetreuung2
    }
}

public enum AnmeldeStatus: String, Codable, Sendable {
    case regulärAngemeldet
    case ausnahmsweiseAngemeldet
    case abgemeldet
}

public enum Wochentag: Int, Codable, CaseIterable, Sendable {
    case montag = 0
    case dienstag = 1
    case mittwoch = 2
    case donnerstag = 3
    case freitag = 4

    public var titel: String {
        switch self {
        case .montag:
            "Montag"
        case .dienstag:
            "Dienstag"
        case .mittwoch:
            "Mittwoch"
        case .donnerstag:
            "Donnerstag"
        case .freitag:
            "Freitag"
        }
    }

    public static func heute(date: Date = Date(), calendar: Calendar = .schulFreilagerWeekCalendar) -> Wochentag? {
        let weekday = calendar.component(.weekday, from: date)

        switch weekday {
        case 2:
            return .montag
        case 3:
            return .dienstag
        case 4:
            return .mittwoch
        case 5:
            return .donnerstag
        case 6:
            return .freitag
        default:
            return nil
        }
    }
}

public struct KrankmeldungWoche: Codable, Sendable, Equatable {
    public var yearForWeekOfYear: Int
    public var weekOfYear: Int
    public var tage: [Wochentag]

    public init(yearForWeekOfYear: Int, weekOfYear: Int, tage: [Wochentag]) {
        self.yearForWeekOfYear = yearForWeekOfYear
        self.weekOfYear = weekOfYear
        self.tage = Array(Set(tage)).sorted(by: { $0.rawValue < $1.rawValue })
    }

    public static func current(tage: [Wochentag], date: Date = Date(), calendar: Calendar = .schulFreilagerWeekCalendar) -> KrankmeldungWoche {
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)

        return KrankmeldungWoche(
            yearForWeekOfYear: components.yearForWeekOfYear ?? 0,
            weekOfYear: components.weekOfYear ?? 0,
            tage: tage
        )
    }

    public func isCurrent(date: Date = Date(), calendar: Calendar = .schulFreilagerWeekCalendar) -> Bool {
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)

        return yearForWeekOfYear == components.yearForWeekOfYear &&
            weekOfYear == components.weekOfYear
    }

    public func aktuellOderNil(date: Date = Date(), calendar: Calendar = .schulFreilagerWeekCalendar) -> KrankmeldungWoche? {
        isCurrent(date: date, calendar: calendar) ? self : nil
    }

    public func istKrank(an wochentag: Wochentag, date: Date = Date(), calendar: Calendar = .schulFreilagerWeekCalendar) -> Bool {
        guard isCurrent(date: date, calendar: calendar) else { return false }
        return tage.contains(wochentag)
    }
}

public extension Calendar {
    static var schulFreilagerWeekCalendar: Calendar {
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = .current
        return calendar
    }
}
