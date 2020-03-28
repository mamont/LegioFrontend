//
//  ProfileTarget.swift
//  Legio
//
//  Created by Mac on 07.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation
import Moya

enum ProfileTarget {
    case getProfile
}

extension ProfileTarget: TargetType {
    
    private enum Keys {
        static let contentType = "Content-Type"
        static let header = "X-Auth-Token"
    }
    
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
        case .getProfile: return "/profile"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProfile: return .get
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
        case .getProfile:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        
        var headers: [String: String] = [
            Keys.contentType: Constants.contentTypeValue,
            Keys.header: NetworkSettings.shared.token]
        
        return headers
    }
    
    
}


