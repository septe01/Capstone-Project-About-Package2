//
//  ProfileMapper.swift
//  About
//
//  Created by septe habudin on 10/01/23.
//

import Foundation

final class ProfileMapper {

    static func mapProfileToDomains(
        input profiles: ProfileResponse
    ) -> ProfileModel {
        return ProfileModel(
            img: profiles.img!,
            name: profiles.name!,
            title: profiles.title!,
            git: profiles.git!,
            instagram: profiles.instagram!,
            linkedin: profiles.linkedin!,
            bio: profiles.bio!
        )
    }

}
