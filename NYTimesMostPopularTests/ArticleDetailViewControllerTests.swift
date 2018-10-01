//
//  ArticleDetailViewControllerTests.swift
//  NYTimesMostPopularTests
//
//  Created by Munadel Qubbaj on 10/1/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import XCTest

class ArticleDetailViewControllerTests: XCTestCase {

    private var articleDetailsVC = ArticleDetailViewController()

    override func setUp() {
        articleDetailsVC = ArticleDetailViewController()
    }

    func testSettingArticleDirectsWebviewToArticleUrl() {

        var article = ArticlesResults()
        article.url = "http://www.google.com/"

        articleDetailsVC.article = article

        XCTAssert(articleDetailsVC.webview.url?.absoluteString == article.url, "Setting an article should direct the webview to it's url")
    }

    func testSettingArticleWithInvalidUrlShouldNotDirectWebview() {
        var article = ArticlesResults()
        article.url = ":abc@#_*&efg"

        articleDetailsVC.article = article

        XCTAssertFalse(articleDetailsVC.webview.url?.absoluteString == article.url, "Setting an article should direct the webview to it's url")
    }
}
