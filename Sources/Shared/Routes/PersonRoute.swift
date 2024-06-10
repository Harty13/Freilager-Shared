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
    
    public struct GetFromBarcode: RequestProtocol {
        public typealias RequestBody = GetFromBarcodeRequestBody
        public typealias ResponseBody = Person
        public let method = HTTPMethod.post
        public let path = "getFromBarcode"
        
        public struct GetFromBarcodeRequestBody: Codable {
            public var barcode: String
            
            public init(barcode: String) {
                self.barcode = barcode
            }
        }
        
        public init() {}
    }
    
    public struct CreateRequest: RequestProtocol {
        public typealias RequestBody = CreateRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "create"
        
        public struct CreateRequestBody: Codable {
            public let barcodeNummer: String
            public let vorname: String
            public let nachname: String
            public let klasse: String?
            public let cluster: String?
            public let kommentar: String?
            public let rolle: Rolle
            public let passwordHash: String
            public let rechte: [Rechte]?
            public let woche: Woche?
            
            public init(barcodeNummer: String, vorname: String, nachname: String, klasse: String?, cluster: String?, kommentar: String?, rolle: Rolle, passwordHash: String, rechte: [Rechte]?, woche: Woche?) {
                self.barcodeNummer = barcodeNummer
                self.vorname = vorname
                self.nachname = nachname
                self.klasse = klasse
                self.cluster = cluster
                self.kommentar = kommentar
                self.rolle = rolle
                self.passwordHash = passwordHash
                self.rechte = rechte
                self.woche = woche
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
            public let klasse: String?
            public let cluster: String?
            public let kommentar: String?
            public let rolle: Rolle?
            public let passwordHash: String?
            public let rechte: [Rechte]?
            public let woche: Woche?
            
            public init(id: UUID, vorname: String?, nachname: String?, klasse: String?, cluster: String?, kommentar: String?, rolle: Rolle?, passwordHash: String?, rechte: [Rechte]?, woche: Woche?) {
                self.id = id
                self.vorname = vorname
                self.nachname = nachname
                self.klasse = klasse
                self.cluster = cluster
                self.kommentar = kommentar
                self.rolle = rolle
                self.passwordHash = passwordHash
                self.rechte = rechte
                self.woche = woche
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
