//
//  AuthServiceImplementation.swift
//  Legio
//
//  Created by Mac on 29.02.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Moya
import Alamofire
import KeychainSwift

class AuthServiceImplementation: AuthService {
    
    func signIn(identity: String, password: String, completion: @escaping AuthResponse) {
        
        let target = MoyaProvider<AuthTarget>()
        target.request(.signIn(
            identity: identity,
            password: password)) { result in
                
                switch result {
                case .success(let response):
                    do {
                        if 200 ... 299 ~= response.statusCode {
                            let singInResponse = try response.map(UserProfile.self)
                            let keychain = KeychainSwift()
                            keychain.set(identity, forKey: Keys.identity)
                            keychain.set(password, forKey: Keys.password)
                            completion(.success(singInResponse))
                        } else {
                            completion(.failure(NetworkError.decodable))
                        }
                    } catch {
                        completion(.failure(NetworkError.decodable))
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                    
                }
        }
    }
    
    func register(identity: String, password: String, completion: @escaping AuthResponse) {
        
        let target = MoyaProvider<AuthTarget>()
        target.request(.register(
            identity: identity,
            password: password)) { result in
                
                switch result {
                case .success(let response):
                    do {
                        if 200 ... 299 ~= response.statusCode {
                            let registerResponse = try response.map(UserProfile.self)
                            completion(.success(registerResponse))
                        } else {
                            completion(.failure(NetworkError.decodable))
                        }
                    } catch {
                        completion(.failure(NetworkError.decodable))
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                    
                }
        }
    }
}
