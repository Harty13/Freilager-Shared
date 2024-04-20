//
//  PersonRoute.swift
//
//
//  Created by Erik Schnell on 13.02.2024.
//

import Foundation

public class PersonRoute: RouteProtocol {
    public static var path: String = "personen"
    
    public init() {}
    
    public struct CreateRequest: RequestProtocol {
        public typealias RequestBody = CreateRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "create"
        
        public struct CreateRequestBody: Codable {
            public let vorname: String
            public let nachname: String
            public let rolle: Rolle
            public let klasse: String?
            public let passwordHash: String
            public let rechte: [Rechte]?
            public let barcodeNummer: String
            
            public init(vorname: String, nachname: String, rolle: Rolle, klasse: String?, passwordHash: String, rechte: [Rechte]?, barcodeNummer: String) {
                self.vorname = vorname
                self.nachname = nachname
                self.rolle = rolle
                self.klasse = klasse
                self.passwordHash = passwordHash
                self.rechte = rechte
                self.barcodeNummer = barcodeNummer
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
            public let id: UUID
            public let vorname: String?
            public let nachname: String?
            public let rolle: Rolle?
            public let klasse: String?
            public let passwordHash: String?
            public let rechte: [Rechte]?
            
            public init(id: UUID, vorname: String?, nachname: String?, rolle: Rolle?, klasse: String?, passwordHash: String?, rechte: [Rechte]?) {
                self.id = id
                self.vorname = vorname
                self.nachname = nachname
                self.rolle = rolle
                self.klasse = klasse
                self.passwordHash = passwordHash
                self.rechte = rechte
            }
        }
        
        public init() {}
    }
    
    public struct DeleteRequest: RequestProtocol {
        public typealias RequestBody = DeleteRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "delete"
        
        public struct DeleteRequestBody: Codable {
            public var personID: UUID
            
            public init(personID: UUID) {
                self.personID = personID
            }
        }
        
        public init() {}
    }
    
    public struct GetAllRequest: RequestProtocol {
        public typealias RequestBody = Empty
        public typealias ResponseBody = [Person]
        public let method = HTTPMethod.post
        public let path = "getAll"
        
        public init() {}
    }
}
