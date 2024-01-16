//
//  BeerAPIManager.swift
//  BeerRecommendNetwork
//
//  Created by 김재석 on 1/16/24.
//

import Foundation
import Alamofire

struct BeerAPIManager {
    func getBeerInfo(beerListHandler: @escaping ([BeerModel]) -> Void) {
        let url = "https://api.punkapi.com/v2/beers"
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [BeerModel].self) { response in
                switch response.result {
                case .success(let success):
                    beerListHandler(success)
                case .failure(_):
                    print("Error")
                }
            }
    }
}
