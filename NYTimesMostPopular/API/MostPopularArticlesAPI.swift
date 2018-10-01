//
//  MostPopularArticlesAPI.swift
//  NYTimesMostPopular
//
//  Created by Munadel Qubbaj on 9/30/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

enum Period: Int {
    case day = 1
    case week = 7
    case month = 30
}

class MostPopularArticlesAPI {

    /// Gets a list of most popular articles from NYT API and calls the responseResult block upon completion
    /// passes the result along with the status to responseResult
    class func getMostPopularArticles(responseResult: @escaping (NYTMostPopularArticlesResponse?, Bool) -> Void) {

        guard let mostPopularArticlesUrl = URL(string: Constants.mainURL + Constants.mostViewedAPI + "\(Period.week.rawValue)" + Constants.jsonExtension) else {
            responseResult(nil, false)
            return
        }

        let parameters: Parameters = [Constants.apiKeyParam: Constants.apiKeyValue]

        Alamofire.request(mostPopularArticlesUrl, method: .get, parameters: parameters).response { (resposeData) in
            guard let jsonResponse = resposeData.data else {
                responseResult(nil, false)
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let articles = try jsonDecoder.decode(NYTMostPopularArticlesResponse.self, from: jsonResponse)
                responseResult(articles, true)

            } catch {
                responseResult(nil, false)
            }

        }
    }

}
