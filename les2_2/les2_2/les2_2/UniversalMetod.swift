//
//  UniversalMetod.swift
//  les2_2
//
//  Created by Роман Чикишев on 23.02.2022.
//

import UIKit
import WebKit

private let sessionVK: URLSession  = {
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    return session
}()

class UniversalMetod {
    
    private let imageService = ImageLoader()
    private let decoder = JSONDecoder()
    
    func loadJson(path: String, queryItems: [URLQueryItem]) {

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else { return}
        let request = URLRequest(url: url)
        let task = sessionVK.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data,
                                                             options: JSONSerialization.ReadingOptions.fragmentsAllowed)
                Storage.share.datafile = data
            } catch {
                print(error)
            }
        }
        task.resume()

    }
    func loadImage(url: String, completion: @escaping(UIImage) -> Void) {
        guard let url = URL(string: url) else { return }
        imageService.loadImage(url: url) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                completion(image)
            case .failure(let error):
                print("error \(error)")
            }
        }
    }

}
