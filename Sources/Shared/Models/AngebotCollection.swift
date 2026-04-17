//
//  AngebotCollection.swift
//
//
//  Created by Erik Schnell on 27.02.2025.
//

import Foundation

public struct AngebotZeit: Codable, Sendable, Hashable {
    public var angebotID: UUID
    public var offenAb: Date
    
    public init(angebotID: UUID, offenAb: Date) {
        self.angebotID = angebotID
        self.offenAb = offenAb
    }
}

public struct AngebotCollection: Identifiable, Codable, Sendable {
    public var id: UUID?
    public var angeboteIDs: [UUID]
    
    /// Optional per-Angebot opening times. If set for an Angebot, it can be opened later than the group start.
    public var offenAbZeiten: [AngebotZeit]?
    
    public init(
        id: UUID? = nil,
        angeboteIDs: [UUID],
        offenAbZeiten: [AngebotZeit]? = nil
    ) {
        self.id = id
        self.angeboteIDs = angeboteIDs
        self.offenAbZeiten = offenAbZeiten
    }
    
    public func offenAbFor(angebotID: UUID) -> Date? {
        offenAbZeiten?.first(where: { $0.angebotID == angebotID })?.offenAb
    }
}
