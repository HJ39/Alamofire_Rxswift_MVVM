//
//  Model.swift
//  Alamofire_RxSwift_MVVM
//
//  Created by 정호진 on 2023/03/05.
//

import Foundation

struct DecodingModel: Codable{
    let id: Int?
    let name: String?
    let githubId: String?
    let commits: Int?
    let tier: String?
    let authStep: String?
    let profileImage: String?
    let rank: Int?
    let tokenAmount: Int?
}


struct Model{
    let id: Int?
    let name: String?
    let githubId: String?
    let commits: Int?
    let tier: String?
    let authStep: String?
    let profileImage: String?
    let rank: Int?
    let tokenAmount: Int?
}
