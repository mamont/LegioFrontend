//
//  NetworkManager.swift
//  Legio
//
//  Created by Марат Нургалиев on 15/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
	
    func save(token: String)
	func registrate(login: String, password: String, completion: @escaping(_ userData: Success?, _ error: Error?) -> Void)
    func userAuth(login: String, password: String, completion: @escaping(_ userData: Success?, _ error: Error?) -> Void)
    func setInvest(value: Int, completion: @escaping(_ : ResponseSetTimeInvest?, _ error: Error?) -> Void)
    func getInterestList(completion: @escaping(_ interests: [Interest]?, _ error: Error?) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
	static let shared = NetworkManager()
	
    private init() {}
    private var token: String = ""
	
	func registrate(login: String, password: String, completion: @escaping(_ userData: Success?, _ error: Error?) -> Void) {
		var urlConstructor = URLComponents()
		
		
		urlConstructor.scheme = "http"
		urlConstructor.host = "legio-app.tmweb.ru"
		urlConstructor.path = "/api/register"
		
		urlConstructor.queryItems = [
			URLQueryItem(name: "email",  value: login),
			URLQueryItem(name: "password", value: password),
		]
		
		guard let registerURL = urlConstructor.url else {
			return
		}
		var request = URLRequest(url: registerURL)
		request.httpMethod = "POST"
		
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			guard let data = data else { return }
            if let stringData = String(data: data, encoding: String.Encoding.utf8) as String? {
                print(stringData)
            }
            
			DispatchQueue.main.async {
				do {
					let userData = try JSONDecoder().decode(Success.self, from: data)
					completion(userData, nil)
				} catch let error {
					print(error)
					completion(nil, error)
				}
			}
			}.resume()
	}
    
    func userAuth(login: String, password: String, completion: @escaping (_ userData:Success?, _ error: Error?) -> Void) {
        var urlConstructor = URLComponents()
        
        
        urlConstructor.scheme = "http"
        urlConstructor.host = "legio-app.tmweb.ru"
        urlConstructor.path = "/api/login"
        
        urlConstructor.queryItems = [
            URLQueryItem(name: "email",  value: login),
            URLQueryItem(name: "password", value: password),
        ]
        
        guard let registerURL = urlConstructor.url else {
            return
        }
        var request = URLRequest(url: registerURL)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            if let stringData = String(data: data, encoding: String.Encoding.utf8) as String? {
                print(stringData)
            }
            DispatchQueue.main.async {
                do {
                    let userData = try JSONDecoder().decode(Success.self, from: data)
                    completion(userData, nil)
                } catch let error {
                    print(error)
                    completion(nil, error)
                }
            }
            }.resume()
    }
    
    func setInvest(value: Int, completion: @escaping(_ : ResponseSetTimeInvest?, _ error: Error?) -> Void) {
        var urlConstructor = URLComponents()
        
        urlConstructor.scheme = "http"
        urlConstructor.host = "legio-app.tmweb.ru"
        urlConstructor.path = "/api/set-invest"
        
        guard let registerURL = urlConstructor.url else {
            return
        }
        var request = URLRequest(url: registerURL)
        request.httpMethod = "POST"
        request.setValue("Bearer \(self.getToken())", forHTTPHeaderField: "Authorization")
       
        let data: [String: Any] = ["invest_value": value]
        let jsonData = try? JSONSerialization.data(withJSONObject: data)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            if let stringData = String(data: data, encoding: String.Encoding.utf8) as String? {
                print(stringData)
            }
            
            DispatchQueue.main.async {
                do {
                    let response = try JSONDecoder().decode(ResponseSetTimeInvest.self, from: data)
                    completion(response, nil)
                } catch let error {
                    print(error)
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    func getInterestList(completion: @escaping(_ interests: [Interest]?, _ error: Error?) -> Void) {
        
        var urlConstructor = URLComponents()
        
        urlConstructor.scheme = "http"
        urlConstructor.host = "legio-app.tmweb.ru"
        urlConstructor.path = "/api/interests"
        
        guard let registerURL = urlConstructor.url else {
            return
        }
        var request = URLRequest(url: registerURL)
        request.httpMethod = "GET"
        request.setValue("Bearer \(self.getToken())", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            if let stringData = String(data: data, encoding: String.Encoding.utf8) as String? {
                print(stringData)
            }
            
            DispatchQueue.main.async {
//                do {
//                    let userData = try JSONDecoder().decode([Interest].self, from: data)
//                    completion(userData, nil)
//                } catch let error {
                    print(error)
                    completion(nil, error)
//                }
            }
        }.resume()
    }
    
    func save(token: String) {
        self.token = token
    }
    
    private func getToken() -> String {
        return self.token
    }
    
}
