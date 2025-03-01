//
//  WebSockets.swift
//
//
//  Created by Erik Schnell on 30.06.2024.
//

import Foundation

public enum SubscriptionType: Codable, Hashable {
    case device(uniqueIdentifier: UUID)
    case angebote
    case angebotDetails(angebotID: UUID)
    case angeboteCollections
    case angeboteCollectionDetails(collectionID: UUID)
    case personen
    case personDetails(personID: UUID)
    case geräte
    
    var dataType: Codable.Type {
        switch self {
        case .device(let uniqueIdentifier):
            return Device?.self
        case .angebote:
            return [Angebot].self
        case .angebotDetails(let angebotID):
            return Angebot?.self
        case .angeboteCollections:
            return [AngebotCollection].self
        case .angeboteCollectionDetails(let collectionID):
            return AngebotCollection?.self
        case .personen:
            return [Person].self
        case .personDetails(_):
            return Person?.self
        case .geräte:
            return [Device].self
        }
    }
}

public struct SubscriptionResponse: Codable {
    public let updates: [SubscriptionUpdate]
    
    public init(updates: [SubscriptionUpdate]) {
        self.updates = updates
    }
}

public struct SubscriptionUpdate: Codable {
    public let type: SubscriptionType
    public var data: Data?
    
    public init(type: SubscriptionType, from codable: Codable?) throws {
        self.type = type
        if let codable {
            self.data = try codable.encode()
        } else {
            self.data = nil
        }
    }
    
    public func decodedData() throws -> Codable? {
        if let data {
            return try type.dataType.decode(from: data)
        } else {
            return nil
        }
    }
}

public struct SubscriptionRequest: Codable {
    public var types: Set<SubscriptionType>
    public var sendInitialData: Bool
    
    public init(types: Set<SubscriptionType>, sendInitialData: Bool) {
        self.types = types
        self.sendInitialData = sendInitialData
    }
}
