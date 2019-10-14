//
//  UserRegister.swift
//  Legio
//
//  Created by MIkkyMouse on 12/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

extension RegisterView {
    func registerUser() {
        
        var urlConstructor = URLComponents()
        
        
        urlConstructor.scheme = "http"
        urlConstructor.host = "legio-app.tmweb.ru"
        urlConstructor.path = "/api/register"
        
        guard let login = textFieldLogin.text,
            let password = textFieldPassword.text else {
                return
        }
        
        urlConstructor.queryItems = [
            URLQueryItem(name: "email",  value: login),
            URLQueryItem(name: "password", value: password),
        ]
        
        guard let registerURL = urlConstructor.url else {
            return
        }
        var requst = URLRequest(url: registerURL)
        requst.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: requst) { (data, response, error) in
            guard let data = data else { return }
            
           
            
            
            DispatchQueue.main.async {
            do {
                
               //   let items = try JSONDecoder().decode(UserData.self, from: data)
                    // userData.token = items.token
                 //self.router?.showSingIn()
               } catch let error {
                   print(error)
              }
           }
        }.resume()
    }
}
