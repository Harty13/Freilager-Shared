//
//  AngebotRoute.swift
//
//
//  Created by Erik Schnell on 13.02.2024.
//

import Foundation

public class AngebotRoute: RouteProtocol {
    public static var path: String = "angebote"

    public init() {}

    public struct CreateRequest: RequestProtocol {
        public typealias RequestBody = CreateRequestBody
        
        public let method = HTTPMethod.post
        public let path = "create"
        
        public struct CreateRequestBody: Codable {
            public let titel: String
            public let emoji: String
            public let beschreibung: String
            public let hasMaxPersonenAnzahl: Bool
            public let maxPersonenAnzahl: Int
            public let checkOutRequired: Bool
            public let hasAuswertung: Bool
            
            public init(
                titel: String,
                emoji: String,
                beschreibung: String,
                hasMaxPersonenAnzahl: Bool,
                maxPersonenAnzahl: Int,
                checkOutRequired: Bool,
                hasAuswertung: Bool
            ) {
                self.titel = titel
                self.emoji = emoji
                self.beschreibung = beschreibung
                self.hasMaxPersonenAnzahl = hasMaxPersonenAnzahl
                self.maxPersonenAnzahl = maxPersonenAnzahl
                self.checkOutRequired = checkOutRequired
                self.hasAuswertung = hasAuswertung
            }
        }
        
        public init() {}
    }
    
    public struct UpdateRequest: RequestProtocol {
        public typealias RequestBody = UpdateRequestBody
        
        public let method = HTTPMethod.post
        public let path = "update"
        
        public struct UpdateRequestBody: Codable {
            public var id: UUID
            public let titel: String?
            public let emoji: String?
            public let beschreibung: String?
            public let hasMaxPersonenAnzahl: Bool?
            public let maxPersonenAnzahl: Int?
            public let checkOutRequired: Bool?
            public let hasAuswertung: Bool?
            
            
            public init(
                id: UUID,
                titel: String? = nil,
                emoji: String? = nil,
                beschreibung: String? = nil,
                hasMaxPersonenAnzahl: Bool? = nil,
                maxPersonenAnzahl: Int? = nil,
                checkOutRequired: Bool? = nil,
                hasAuswertung: Bool? = nil
            ) {
                self.id = id
                self.titel = titel
                self.emoji = emoji
                self.beschreibung = beschreibung
                self.hasMaxPersonenAnzahl = hasMaxPersonenAnzahl
                self.maxPersonenAnzahl = maxPersonenAnzahl
                self.checkOutRequired = checkOutRequired
                self.hasAuswertung = hasAuswertung
            }
        }
        
        public init() {}
    }
    
    public struct DeleteRequest: RequestProtocol {
        public typealias RequestBody = DeleteRequestBody

        public let method = HTTPMethod.delete
        public let path = "delete"
        
        public struct DeleteRequestBody: Codable {
            public let id: UUID
            
            public init(id: UUID) {
                self.id = id
            }
        }
        
        public init() {}
    }
    
    public struct UebernehmenRequest: RequestProtocol {
        public typealias RequestBody = UebernehmenRequestBody
        public let method = HTTPMethod.post
        public let path = "uebernehmen"
        
        public struct UebernehmenRequestBody: Codable {
            public let personID: UUID
            public let angebotID: UUID
            public let deviceID: UUID
            
            public init(personID: UUID, angebotID: UUID, deviceID: UUID) {
                self.personID = personID
                self.angebotID = angebotID
                self.deviceID = deviceID
            }
        }
        
        public init() {}
    }
    
    public struct VerlassenRequest: RequestProtocol {
        public typealias RequestBody = VerlassenRequestBody

        public let method = HTTPMethod.post
        public let path = "verlassen"
        
        public struct VerlassenRequestBody: Codable {
            public let personID: UUID
            public let angebotID: UUID
            public let deviceID: UUID
            
            public init(personID: UUID, angebotID: UUID, deviceID: UUID) {
                self.personID = personID
                self.angebotID = angebotID
                self.deviceID = deviceID
            }
        }
        
        public init() {}
    }
    
    public struct BeendenRequest: RequestProtocol {
        public typealias RequestBody = BeendenRequestBody

        public let method = HTTPMethod.post
        public let path = "beenden"
        
        public struct BeendenRequestBody: Codable {
            public let angebotID: UUID
            
            public init(angebotID: UUID) {
                self.angebotID = angebotID
            }
        }
        
        public init() {}
    }
    
    public struct CheckOutPersonRequest: RequestProtocol {
        public typealias RequestBody = CheckOutPersonRequestBody

        public let method = HTTPMethod.post
        public let path = "checkOutPerson"

        public struct CheckOutPersonRequestBody: Codable {
            public let personID: UUID
            public let angebotID: UUID
            
            public init(personID: UUID, angebotID: UUID) {
                self.personID = personID
                self.angebotID = angebotID
            }
        }
        
        public init() {}
    }
    
    public struct CreateAngebotCollectionRequest: RequestProtocol {
        public typealias RequestBody = CreateAngebotCollectionRequestBody

        public let method = HTTPMethod.post
        public let path = "createAngebotCollection"

        public struct CreateAngebotCollectionRequestBody: Codable {
            public let angeboteIDs: [UUID]
            
            public init(angeboteIDs: [UUID]) {
                self.angeboteIDs = angeboteIDs
            }
        }
        
        public init() {}
    }
    
    public struct DeleteAngebotCollectionRequest: RequestProtocol {
        public typealias RequestBody = DeleteAngebotCollectionRequestBody

        public let method = HTTPMethod.post
        public let path = "deleteAngebotCollection"

        public struct DeleteAngebotCollectionRequestBody: Codable {
            public let id: UUID
            
            public init(id: UUID) {
                self.id = id
            }
        }
        
        public init() {}
    }
    
    public struct AngebotCollectionStartenRequest: RequestProtocol {
        public typealias RequestBody = AngebotCollectionStartenRequestBody

        public let method = HTTPMethod.post
        public let path = "startAngebotCollection"

        public struct AngebotCollectionStartenRequestBody: Codable {
            public let deviceID: UUID
            public let collectionID: UUID
            
            public init(deviceID: UUID, collectionID: UUID) {
                self.deviceID = deviceID
                self.collectionID = collectionID
            }
        }
        
        public init() {}
    }
    
    public struct AngebotCollectionBeendenRequest: RequestProtocol {
        public typealias RequestBody = AngebotCollectionBeendenRequestBody

        public let method = HTTPMethod.post
        public let path = "endAngebotCollection"

        public struct AngebotCollectionBeendenRequestBody: Codable {
            public let collectionID: UUID
            
            public init(collectionID: UUID) {
                self.collectionID = collectionID
            }
        }
        
        public init() {}
    }
}
