//
//  ProfileResponse.swift
//  About
//
//  Created by septe habudin on 10/01/23.
//

import Foundation

struct ProfileResponse: Decodable {
    let img: String?
    let name, title: String?
    let git, instagram, linkedin: String?
    let bio: String?
}

