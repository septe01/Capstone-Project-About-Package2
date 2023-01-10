//
//  Injection.swift
//  About
//
//  Created by septe habudin on 10/01/23.
//

import Foundation

@available(macOS 10.15, *)
public final class Injection: NSObject {
    private func provideRepositoryProfile() -> ProfileRepositoryProtocol {

        let remote: ProfileDataSource = ProfileDataSource.sharedInstance

        return ProfileRepository.sharedInstance(remote)
    }

   public func provideProfile() -> ProfileUseCase {
      let repository = provideRepositoryProfile()
      return ProfileInteractor(repository: repository)
    }
}
