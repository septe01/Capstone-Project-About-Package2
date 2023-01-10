//
//  ProfileInteractor.swift
//  About
//
//  Created by septe habudin on 10/01/23.
//

import Foundation
import Combine

@available(macOS 10.15, *)
public protocol ProfileUseCase {

    func getProfiles() -> AnyPublisher<ProfileModel, Error>

}

@available(macOS 10.15, *)
public class ProfileInteractor: ProfileUseCase {

    private let repository: ProfileRepositoryProtocol

    required init(repository: ProfileRepositoryProtocol) {
        self.repository = repository
    }

    public func getProfiles() -> AnyPublisher<ProfileModel, Error> {
        return repository.getProfiles()
    }

}
