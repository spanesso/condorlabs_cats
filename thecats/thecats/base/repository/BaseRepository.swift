//
//  BaseRepository.swift
//  thecats
//
//  Created by Sebastian Panesso on 8/28/20.
//  Copyright © 2020 CondorLabs. All rights reserved.
//

import Foundation
import Alamofire

class BaseRepository {
    
    var parser:JSONParser!
    
    init(){
        self.parser = JSONParser()
    }
    
    public func requestGET(url:String , completionHandler: @escaping (Data?) -> Void) -> () {
        Alamofire.request(url, method: .get,encoding: URLEncoding.default, headers: nil)
            .responseJSON(completionHandler: {
                response in
                guard response.response?.statusCode == 200 else {
                    completionHandler(nil)
                    return
                }
                completionHandler(response.data)
            })
    }
    
    
}
