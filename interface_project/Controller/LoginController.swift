//
//  LoginController.swift
//  interface_project
//
//  Created by acer on 27.12.2022.
//

import Foundation
import WebKit

final class LoginController: UIViewController {
    private lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        let view = WKWebView(frame: .zero, configuration: config)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
        loadAuth()
    }
}

extension LoginController: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map {$0.components(separatedBy: "#")}
            .reduce([String: String]()) { result, param in
                var dict = result
                var key = param[0]
                var value = param[1]
                dict[key] = value
                return dict
            }
        
        if let token = params["access_token"], let id = params["user_id"] {
            Session.instance.userId = Int(id)!
            Session.instance.token = token
            print(token)
            decisionHandler(.cancel)
//            let vc = WeatherView
//            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

private extension LoginController {
    func configureWebView() {
        navigationController?.navigationBar.isHidden = true
        webView.navigationDelegate = self
    }
    
    func loadAuth() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8126570"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline, friends, photos, groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "0"),

        ]
        
        guard let url = urlComponents.url else {return}
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
