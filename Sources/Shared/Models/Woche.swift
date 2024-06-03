//
//  File.swift
//  
//
//  Created by Erik Schnell on 03.06.2024.
//

import Foundation

struct Woche: Content {
    var montag: Tag
    var dienstag: Tag
    var mittwoch: Tag
    var donnerstag: Tag
    var freitag: Tag
}

struct Tag: Content {
    var morgentisch: AnmeldeStatus
    var mittagstisch: AnmeldeStatus
    var nachmittagsbetreuung1: AnmeldeStatus
    var nachmittagsbetreuung2: AnmeldeStatus
}

enum AnmeldeStatus: String, Content {
    case regulärAngemeldet
    case ausnahmsweiseAngemeldet
    case abgemeldet
}
