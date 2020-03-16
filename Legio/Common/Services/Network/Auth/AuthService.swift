//
//  AuthService.swift
//  Legio
//
//  Created by Mac on 29.02.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

protocol AuthService {
    
    func signIn(identity: String, password: String, completion: @escaping AuthResponse)
    func register(identity: String, password: String, completion: @escaping AuthResponse)
}

extension AuthService {
    
    public typealias AuthResponse = (Result<UserProfile, Error>) -> Void
}
