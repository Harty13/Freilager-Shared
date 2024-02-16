//
//  BarcodeRoute.swift
//  
//
//  Created by Erik Schnell on 13.02.2024.
//

import Foundation

public class BarcodeRoute: RouteProtocol {
    public static var path: String = "barcode"

    public init() {}

    public struct ScannedRequest: RequestProtocol {
        public typealias RequestBody = ScannedRequestBody
        public typealias ResponseBody = ScannedResponseBody
        public let method = HTTPMethod.post
        public let path = "scanned"
        
        public struct ScannedRequestBody: Codable {
            public let barcodeNummer: String
            public let angebot: Angebot?
            
            public init(barcodeNummer: String, angebot: Angebot?) {
                self.barcodeNummer = barcodeNummer
                self.angebot = angebot
            }
        }
        
        public struct ScannedResponseBody: Codable {
            public let person: Person
            public let action: Action?
            
            public init(person: Person, action: Action?) {
                self.person = person
                self.action = action
            }
            
            public enum Action: Codable {
                case login
                case checkIn
                case checkOut
            }
        }
        
        public init() {}
    }
}
