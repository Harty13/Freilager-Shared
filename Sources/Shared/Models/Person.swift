//
//  File.swift
//  
//
//  Created by Erik Schnell on 13.02.2024.
//

import Foundation

public struct Person: Identifiable, Codable {
    public var id: UUID?
    public var vorname: String?
    public var nachname: String?
    public var klasse: String?
    public var rolle: Rolle?
    public var rechte: [Rechte]?
    public var barcodeNummer: String?
    public var woche: Woche?
    
    public init(
        id: UUID? = nil,
        vorname: String? = nil,
        nachname: String? = nil,
        klasse: String? = nil,
        rolle: Rolle? = nil,
        rechte: [Rechte]? = nil,
        barcodeNummer: String? = nil,
        woche: Woche? = nil
    ) {
        self.id = id
        self.vorname = vorname
        self.nachname = nachname
        self.klasse = klasse
        self.rolle = rolle
        self.rechte = rechte
        self.barcodeNummer = barcodeNummer
        self.woche = woche
    }
}
