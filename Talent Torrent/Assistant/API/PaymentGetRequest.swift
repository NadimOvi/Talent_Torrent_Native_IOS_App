//
//  PaymentGetRequest.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 23/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import Foundation
import Alamofire

protocol PaymentGetRequestDataSource {
    func containDataFromAPI(model: Any)
}

struct PaymentGetRequest {
    var delegate: PaymentGetRequestDataSource?
    
    func setTrailingURL<T: Decodable>(trailingURL: String, modelType: T.Type) {
        let hit_url = APIURL + trailingURL
        print(hit_url)
        getdata_api(full_url: hit_url, model_type: modelType)
    }
    
    func getdata_api<T: Decodable>(full_url: String, model_type: T.Type) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        AF.request(full_url, method: .get).validate().responseDecodable(of: model_type, decoder: decoder) { response in
            
            switch response.result {
            case .success(let value):
                delegate?.containDataFromAPI(model: value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
