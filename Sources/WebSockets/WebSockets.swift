//
//  File.swift
//  
//
//  Created by Erik Schnell on 30.06.2024.
//

import Foundation

public enum SubscriptionType: Codable, Hashable {
    case device(uniqueIdentifier: UUID)
    case angebotDetails(angebotID: UUID)
    case angebote
    
    var dataType: Codable.Type {
        switch self {
        case .device(let uniqueIdentifier):
            return Device.self
        case .angebotDetails(let angebotID):
            return Angebot?.self
        case .angebote:
            return [Angebot].self
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
    public var data: Data
    
    public init(type: SubscriptionType, from codable: Codable) throws {
        self.type = type
        self.data = try codable.encode()
    }
    
    public func decodedData() throws -> Codable {
        return try type.dataType.decode(from: data)
    }
}

public struct SubscriptionRequest: Codable {
    public var subscriptions: [SubscriptionType]
    public var sendInitialData: Bool
    
    public init(subscriptions: [SubscriptionType], sendInitialData: Bool) {
        self.subscriptions = subscriptions
        self.sendInitialData = sendInitialData
    }
}

extension SubscriptionType {
    func getDataType() -> Codable {
        return [Angebot].self
    }
}
