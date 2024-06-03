//
//  Woche.swift
//
//
//  Created by Erik Schnell on 03.06.2024.
//

import Foundation

public struct Woche: Codable {
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
}

public struct Tag: Codable {
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

public enum AnmeldeStatus: String, Codable {
    case regulärAngemeldet
    case ausnahmsweiseAngemeldet
    case abgemeldet
}
