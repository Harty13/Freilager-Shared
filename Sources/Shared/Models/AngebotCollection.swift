//
//  AngebotCollection.swift
//
//
//  Created by Erik Schnell on 27.02.2025.
//

import Foundation

public struct AngebotCollection: Identifiable, Codable {
    public var id: UUID?
    public var angeboteIDS: [UUID]
    
    public init(
        id: UUID? = nil,
        angeboteIDS: [UUID]
    ) {
        self.id = id
        self.angeboteIDS = angeboteIDS
    }
}
