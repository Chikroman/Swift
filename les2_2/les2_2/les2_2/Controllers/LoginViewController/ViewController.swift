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
    

 
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAuth()
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
            URLQueryItem(name: "scope", value: "offline, friends, photos, groups, wall"),
            URLQueryItem(name: "response_type", value: "token")//,
           // URLQueryItem(name: "revoke", value: "0")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        wkWebView.load(request)
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
//            let queryItemsPhotos = [
//                URLQueryItem(name: "access_token", value: session.token),
//                URLQueryItem(name: "album_id", value: "profile"),
//                URLQueryItem(name: "v", value: "5.81")]
            

           
//            let jsonFilePhotos = UniversalMetod().loadJson(path: "/method/photos.get", queryItems: queryItemsPhotos)

        }
    }

        
 
}
