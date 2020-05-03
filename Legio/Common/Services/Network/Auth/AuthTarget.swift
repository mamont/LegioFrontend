//
//  AuthTarget.swift
//  Legio
//
//  Created by Mac on 29.02.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation
import Moya

enum AuthTarget {
    case signIn(identity: String, password: String)
    case register(identity: String, password: String)
}

enum Keys {
    static let contentType = "Content-Type"
    static let identity = "identity"
    static let password = "password"
}

extension AuthTarget: TargetType {
    
    private enum Constants {
        static let contentTypeValue = "application/json"
    }
    
    var baseURL: URL {
        guard let url = URL(string: NetworkSettings.shared.baseUrlString) else {
            fatalError("base Url cannot be configured")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .signIn: return "/user-sessions"
            
        case .register: return "/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn: return .post
            
        case .register: return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var parameterEncoding: Moya.ParameterEncoding {
         return JSONEncoding.default
    }
    
    public var task: Task {
        switch self {
        case .signIn(let identity, let password):
            return .requestParameters(
                parameters: [
                    Keys.identity: identity,
                    Keys.password: password],
                encoding: JSONEncoding.default)
            
        case .register(let identity, let password):
            return .requestParameters(
                parameters: [
                    Keys.identity: identity,
                    Keys.password: password],
                encoding: JSONEncoding.default)
            
        }
    }
    
    public var headers: [String: String]? {
        return [Keys.contentType: Constants.contentTypeValue]
    }
    
    
}

