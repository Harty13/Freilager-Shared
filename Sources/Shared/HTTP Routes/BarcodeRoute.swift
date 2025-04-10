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
            public let angebotCollection: AngebotCollection?
            
            public init(barcodeNummer: String, angebot: Angebot?) {
                self.barcodeNummer = barcodeNummer
                self.angebot = angebot
                self.angebotCollection = nil
            }
            
            public init(barcodeNummer: String, angebotCollection: AngebotCollection?) {
                self.barcodeNummer = barcodeNummer
                self.angebot = nil
                self.angebotCollection = angebotCollection
            }
        }
        
        public struct ScannedResponseBody: Codable {
            public let person: Person
            public let action: Action?
            
            public init(person: Person, action: Action?) {
                self.person = person
                self.action = action
            }
            
            public enum Action: Codable, Equatable {
                case login
                case showAngebotCollectionOptions
                case checkIn
                case checkOut
                case alreadyCheckedIn(at: Angebot)
                case angebotIsFull
                
                public static func ==(lhs: Action, rhs: Action) -> Bool {
                    switch (lhs, rhs) {
                    case (.login, .login), (.checkIn, .checkIn), (.checkOut, .checkOut), (.showAngebotCollectionOptions, .showAngebotCollectionOptions), (.angebotIsFull, .angebotIsFull):
                        return true
                    case (let .alreadyCheckedIn(lAngebot), let .alreadyCheckedIn(rAngebot)):
                        return lAngebot.id == rAngebot.id
                    default:
                        return false
                    }
                }
            }
        }
        
        public init() {}
    }
}
