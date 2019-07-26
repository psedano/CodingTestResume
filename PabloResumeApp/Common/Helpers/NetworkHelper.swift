//
//  NetworkHelper.swift
//  PabloResumeApp
//
//  Created by Pablo Sedano on 7/25/19.
//  Copyright © 2019 Pablo Sedano. All rights reserved.
//

import Foundation

class NetworkHelper {
    typealias ServiceResponse = (_ homeModel: HomeModel) -> Void
    var responseClosure: ServiceResponse?
    
    func requestFromService(serviceResponse: @escaping ServiceResponse) {
        responseClosure = serviceResponse
        let url = URL(string: GlobalConstants.url)
        guard let serviceURL = url else { return }
        var request = URLRequest(url: serviceURL)
        request.httpMethod = HttpMethods.GET.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = self.responseClosure else { return }
            
            guard let responseData = data else { return }
            let homeModel = try! JSONDecoder().decode(HomeModel.self, from: responseData)
            
            DispatchQueue.main.async {
                response(homeModel)
            }
        }.resume()
    }
}
