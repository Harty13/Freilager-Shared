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
            public let token: String
            
            public init(token: String) {
                self.token = token
            }
        }
        
        public init() {}
    }
    
    public struct LogoutRequest: RequestProtocol {
        public typealias RequestBody = Empty
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "logout"
        
        public init() {}
    }
}

