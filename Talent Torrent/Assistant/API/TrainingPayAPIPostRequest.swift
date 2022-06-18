//
//  TrainingPayAPIPostRequest.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import Foundation
import Alamofire
//   FIXME:- Change protocol name
protocol TrainingPayAPIPostRequestDataSource {
    func trainingApplyDataFromAPI(model: Any)
    func trainingApplyErrorFromAPI(errorMassage: String)
}

struct TrainingPayAPIPostRequest {
//    FIXME:- Change Name of Protocol
    var delegate: TrainingPayAPIPostRequestDataSource?
    
//    FIXME:- Change Name of PostMOdelName
    typealias PostModel = PayTrainningPostModel
    
    func set_trailing_url<T: Decodable>(trailing_url: String, getModelType: T.Type, postModel: PostModel, headers: HTTPHeaders) {
        
        let hit_url = APIURL + trailing_url
        print(hit_url)
        
        getdata_api(fullURL: hit_url, getModelType: getModelType, postModel: postModel, headers: headers)
    }
    
    func getdata_api<T: Decodable>(fullURL: String, getModelType: T.Type, postModel: PostModel, headers: HTTPHeaders) {

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
//        Alamofire.request(URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON
    

        AF.request(fullURL,
                  method: .post,
                  parameters: postModel,
                  encoder: JSONParameterEncoder.default,
                  headers: headers).responseJSON { response in
                    
                    debugPrint(response)
                    switch response.result {
                        case .success(let value):
                            delegate?.trainingApplyDataFromAPI(model: value)
                        case .failure(let error):
                            delegate?.trainingApplyErrorFromAPI(errorMassage: error.localizedDescription)
                        }
        }
    }
}



