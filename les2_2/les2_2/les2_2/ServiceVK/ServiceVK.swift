//
//  ServiceVK.swift
//  les2_2
//
//  Created by Роман Чикишев on 16.02.2022.
//

import Foundation

class ServiceVK {

 
    
    func loadJson() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "user_id", value: String(Storage.share.userId))]
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data,
                                                             options: JSONSerialization.ReadingOptions.fragmentsAllowed)
                print(json)
            } catch {
                print("")
            }
        }
        task.resume()
    }
}
