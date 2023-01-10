//
//  ProfileDataSource.swift
//  About
//
//  Created by septe habudin on 10/01/23.
//

import Foundation
import Alamofire
import Combine

@available(macOS 10.15, *)
protocol ProfileDataSourceProtocol {

    func getProfiles() -> AnyPublisher<ProfileResponse, Error>

}

final class ProfileDataSource: NSObject {

    private override init() { }

    static let sharedInstance: ProfileDataSource =  ProfileDataSource()

}

@available(macOS 10.15, *)
extension ProfileDataSource: ProfileDataSourceProtocol {
    func getProfiles() -> AnyPublisher<ProfileResponse, Error> {
        return Future<ProfileResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.profile.url) {
                AF.request(url)
                    .responseDecodable(of: ProfileResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}

