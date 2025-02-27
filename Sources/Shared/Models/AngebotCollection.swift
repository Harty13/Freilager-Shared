//
//  AngebotCollection.swift
//
//
//  Created by Erik Schnell on 27.02.2025.
//

import Foundation

public struct AngebotCollection: Identifiable, Codable {
    public var id: UUID?
    public var angeboteIDs: [UUID]
    
    public init(
        id: UUID? = nil,
        angeboteIDs: [UUID]
    ) {
        self.id = id
        self.angeboteIDs = angeboteIDs
    }
}
