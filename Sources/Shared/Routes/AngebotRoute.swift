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
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "create"
        
        public struct CreateRequestBody: Codable {
            public let titel: String
            public let beschreibung: String
            
            public init(titel: String, beschreibung: String) {
                self.titel = titel
                self.beschreibung = beschreibung
            }
        }
        
        public init() {}
    }
    
    public struct UpdateRequest: RequestProtocol {
        public typealias RequestBody = UpdateRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "update"
        
        public struct UpdateRequestBody: Codable {
            public var id: UUID
            public let titel: String?
            public let beschreibung: String?
            public let maxPersonenAnzahl: Int?
            
            public init(id: UUID, titel: String? = nil, beschreibung: String? = nil, maxPersonenAnzahl: Int? = nil) {
                self.id = id
                self.titel = titel
                self.beschreibung = beschreibung
                self.maxPersonenAnzahl = maxPersonenAnzahl
            }
        }
        
        public init() {}
    }
    
    public struct DeleteRequest: RequestProtocol {
        public typealias RequestBody = DeleteRequestBody
        public typealias ResponseBody = HTTPStatus
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
        public typealias ResponseBody = HTTPStatus
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
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "verlassen"
        
        public struct VerlassenRequestBody: Codable {
            public let personID: UUID
            public let angebotID: UUID
            
            public init(personID: UUID, angebotID: UUID) {
                self.personID = personID
                self.angebotID = angebotID
            }
        }
        
        public init() {}
    }
    
    public struct GetAllRequest: RequestProtocol {
        public typealias RequestBody = Empty
        public typealias ResponseBody = [Angebot]
        public let method = HTTPMethod.get
        public let path = "getAll"
        
        public init() {}
    }
}
