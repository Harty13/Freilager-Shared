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
        public typealias ResponseBody = Person
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
        
        public init() {}
    }
}
