//
//  ViewController.swift
//  les2_2
//
//  Created by Роман Чикишев on 27.12.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var wkWebView: WKWebView! {
        didSet {
            wkWebView.navigationDelegate = self
        }
    }
    var session = Storage.share
    
    private let sessionVK: URLSession  = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
//        fillFriendsData()
//        fillGroupData()
        loadAuth()
        loadJson(path: "/method/friends.get")
        loadJson(path: "/method/groups.get")
        loadJson(path: "/method/photos.get")
    }
    
 
 
    func fillFriendsData() {
        let friends1 = Friend(name: "Des", avatar: "Des1", fotos: ["Des1","Des2"])
        let friends2 = Friend(name: "Sidor", avatar: "Sidor1", fotos: ["Sidor1","Sidor2"])
        Storage.share.myFriends.append(friends1)
        Storage.share.myFriends.append(friends2)
    }
    func fillGroupData() {
        let groups1 = Group(name: "Клуб любителей пива", avatar: "beer1", description: "Любители пива")
        let groups2 = Group(name: "Клуб любителей шашлыка", avatar: "shashlik1", description: "Любители шашлыка")
        Storage.share.allGroups.append(groups1)
        Storage.share.allGroups.append(groups2)
    }
}

private extension ViewController {
    func loadAuth() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8081436"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline, friends, photos, groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "0")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        wkWebView.load(request)
    }
    
    func loadJson(path: String) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = path
        urlComponents.queryItems = [
            URLQueryItem(name: "user_id", value: String(Storage.share.userId))]
        guard let url = urlComponents.url else { return }
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
                print(json)
            } catch {
                print("")
            }
        }
        task.resume()
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String: String]()) {result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        if let token = params["access_token"], let userID = params["user_id"] {
            session.token = token
            session.userId = Int(userID) ?? 0
            print(token)
            
            decisionHandler(.cancel)
            performSegue(withIdentifier: "fromLoginTabbar", sender: self)
        }
    }
}
