//
//  AngebotCollection.swift
//
//
//  Created by Erik Schnell on 27.02.2025.
//

import Foundation

public struct AngebotCollection: Identifiable, Codable {
    public var id: UUID?
    public var angebote: [Angebot]
    
    public init(
        id: UUID? = nil,
        angebote: [Angebot]
    ) {
        self.id = id
        self.angebote = angebote
    }
}
