//
//  File.swift
//  
//
//  Created by Erik Schnell on 13.02.2024.
//

import Foundation

public struct Person: Identifiable, Codable {
    public var id: UUID?
    public var barcodeNummer: String?
    public var vorname: String?
    public var nachname: String?
    public var klasse: String?
    public var cluster: String?
    public var kommentar: String?
    public var rolle: Rolle?
    public var rechte: [Rechte]?
    public var woche: Woche?
    public var lastAngebot: LastAngebot?
    
    public init(
        id: UUID? = nil,
        barcodeNummer: String? = nil,
        vorname: String? = nil,
        nachname: String? = nil,
        klasse: String? = nil,
        cluster: String? = nil,
        kommentar: String? = nil,
        rolle: Rolle? = nil,
        rechte: [Rechte]? = nil,
        woche: Woche? = nil,
        lastAngebot: LastAngebot? = nil
    ) {
        self.id = id
        self.barcodeNummer = barcodeNummer
        self.vorname = vorname
        self.nachname = nachname
        self.klasse = klasse
        self.cluster = cluster
        self.kommentar = kommentar
        self.rolle = rolle
        self.rechte = rechte
        self.woche = woche
        self.lastAngebot = lastAngebot
    }
}

public struct LastAngebot: Codable {
    public var angebot: Angebot
    public var checkInTime: Date?
    public var checkOutTime: Date?
    
    public init(angebot: Angebot, checkInTime: Date?, checkOutTime: Date?) {
        self.angebot = angebot
        self.checkInTime = checkInTime
        self.checkOutTime = checkOutTime
    }
}
