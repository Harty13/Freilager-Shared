//
//  AuthRoute.swift
//
//
//  Created by Erik Schnell on 13.02.2024.
//

import Foundation

public class AuthRoute: RouteProtocol {
    public static var path: String = "auth"

    public init() {}

    public struct LoginRequest: RequestProtocol {
        public typealias RequestBody = LoginRequestBody
        public typealias ResponseBody = LoginResponseBody
        
        public let method = HTTPMethod.post
        public let path = "login"
        
        public struct LoginRequestBody: Codable {
            public let barcodeNummer: String
            public let password: String
            
            public init(barcodeNummer: String, password: String) {
                self.barcodeNummer = barcodeNummer
                self.password = password
            }
        }
        
        public struct LoginResponseBody: Codable {
            public let token: UUID
            public let person: Person
            
            public init(token: UUID, person: Person) {
                self.token = token
                self.person = person
            }
        }
        
        public init() {}
    }
    
    public struct LogoutRequest: RequestProtocol {
        public typealias RequestBody = Empty
        
        public let method = HTTPMethod.post
        public let path = "logout"
        
        public init() {}
    }
}

