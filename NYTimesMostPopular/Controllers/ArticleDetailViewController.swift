//
//  ArticleDetailViewControl.swift
//  NYTimesMostPopular
//
//  Created by Munadel Qubbaj on 9/30/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit
import WebKit

class ArticleDetailViewController: UIViewController, WKUIDelegate {

    var webview: WKWebView!
    var article: ArticlesResults? {
        didSet {
            guard article?.url != oldValue?.url else {return}
            configureView()
        }
    }

    func configureView() {
        if let detail = article, let urlString = detail.url, let myURL = URL(string: urlString) {
            addWebView()
            let myRequest = URLRequest(url: myURL)
            webview.load(myRequest)
            title = detail.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func addWebView() {
        if webview != nil { webview.removeFromSuperview() }
        let webConfiguration = WKWebViewConfiguration()
        webview = WKWebView(frame: .zero, configuration: webConfiguration)
        webview.uiDelegate = self
        view = webview
    }
}

