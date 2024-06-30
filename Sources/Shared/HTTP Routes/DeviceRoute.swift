//
//  DeviceRoute.swift
//
//
//  Created by Erik Schnell on 21.03.2024.
//

import Foundation

public class DeviceRoute: RouteProtocol {
    public static var path: String = "devices"
    
    public init() {}
    
    public struct CreateRequest: RequestProtocol {
        public typealias RequestBody = CreateRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "create"
        
        public struct CreateRequestBody: Codable {
            public var uniqueIdentifier: UUID
            public var deviceType: DeviceType
            public var deviceModus: DeviceModus
            public var ownerBarcode: String?
            public var ownerPassword: String?
            public var kommentar: String?
            
            public init(uniqueIdentifier: UUID, deviceType: DeviceType, deviceModus: DeviceModus, ownerBarcode: String? = nil, ownerPassword: String? = nil, kommentar: String? = nil) {
                self.uniqueIdentifier = uniqueIdentifier
                self.deviceType = deviceType
                self.deviceModus = deviceModus
                self.ownerBarcode = ownerBarcode
                self.ownerPassword = ownerPassword
                self.kommentar = kommentar
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
            public var deviceStatus: DeviceStatus
            public var kommentar: String?
            
            public init(id: UUID, deviceStatus: DeviceStatus, kommentar: String?) {
                self.id = id
                self.deviceStatus = deviceStatus
                self.kommentar = kommentar
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
            public var id: UUID
            
            public init(id: UUID) {
                self.id = id
            }
        }
        
        public init() {}
    }
    
    public struct GetAllRequest: RequestProtocol {
        public typealias RequestBody = Empty
        public typealias ResponseBody = [Device]
        public let method = HTTPMethod.post
        public let path = "getAll"
        
        public init() {}
    }
    
    public struct ApproveDeviceRequest: RequestProtocol {
        public typealias RequestBody = ApproveDeviceRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "approveDevice"
        
        public struct ApproveDeviceRequestBody: Codable {
            public var id: UUID
            
            public init(id: UUID) {
                self.id = id
            }
        }
        public init() {}
    }
    
    public struct RejectDeviceRequest: RequestProtocol {
        public typealias RequestBody = RejectDeviceRequestBody
        public typealias ResponseBody = HTTPStatus
        public let method = HTTPMethod.post
        public let path = "rejectDevice"
        
        public struct RejectDeviceRequestBody: Codable {
            public var id: UUID
            
            public init(id: UUID) {
                self.id = id
            }
        }
        
        public init() {}
    }
    
//    public struct UpdateDeviceStatusRequest: RequestProtocol {
//        public typealias RequestBody = UpdateDeviceStatusRequestBody
//        public typealias ResponseBody = HTTPStatus
//        public let method = HTTPMethod.post
//        public let path = "updateDeviceStatus"
//        
//        public struct UpdateDeviceStatusRequestBody: Codable {
//            public var id: UUID
//            public var deviceStatus: DeviceStatus
//            
//            public init(id: UUID, deviceStatus: DeviceStatus) {
//                self.id = id
//                self.deviceStatus = deviceStatus
//            }
//        }
//        
//        public init() {}
//    }
    
    public struct InitializeDeviceRequest: RequestProtocol {
        public typealias RequestBody = InitializeDeviceBody
        public typealias ResponseBody = InitializeDeviceResponse
        public let method = HTTPMethod.post
        public let path = "initialize"
        
        public struct InitializeDeviceBody: Codable {
            public var uniqueIdentifier: UUID
            
            public init(uniqueIdentifier: UUID) {
                self.uniqueIdentifier = uniqueIdentifier
            }
        }
        
        public struct InitializeDeviceResponse: Codable {
            public var device: Device?
            
            public init(device: Device?) {
                self.device = device
            }
        }


        
        public init() {}
    }
    
}
