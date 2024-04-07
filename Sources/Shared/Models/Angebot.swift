//
//  Angebot.swift
//  
//
//  Created by Erik Schnell on 13.02.2024.
//

import Foundation

public struct Angebot: Identifiable, Codable {
    public var id: UUID?
    public var titel: String?
    public var beschreibung: String?
    public var betreuungsPersonen: [Person]?
    
    public var personen: [Person]?
    public var personenAnzahl: Int?
    public var maxPersonenAnzahl: Int?
    
    public init(
        id: UUID? = nil,
        titel: String? = nil,
        beschreibung: String? = nil,
        betreuungsPersonen: [Person]? = nil,
        personen: [Person]? = nil,
        personenAnzahl: Int? = nil,
        maxPersonenAnzahl: Int? = nil
    ) {
        self.id = id
        self.titel = titel
        self.beschreibung = beschreibung
        self.betreuungsPersonen = betreuungsPersonen
        self.personen = personen
        self.personenAnzahl = personenAnzahl
        self.maxPersonenAnzahl = maxPersonenAnzahl
    }
}
