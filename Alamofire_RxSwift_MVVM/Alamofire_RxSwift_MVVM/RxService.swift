//
//  RxService.swift
//  Alamofire_RxSwift_MVVM
//
//  Created by 정호진 on 2023/03/05.
//

import Foundation
import RxSwift
import Alamofire

class RxService {
    static let escape = RxService()
    let localhost = ""
    
    func postData() -> Observable<Int>{
        let url = "http://\(self.localhost)/api/members"
        let body = ["githubId" : "HJ39"]
        
        return Observable<Int>.create(){ observer in
            AF.request(url,
                       method: .post,
                       parameters: body,
                       encoding: JSONEncoding.default,
                       headers: ["Content-type": "application/json"])
            .validate(statusCode: 200..<201)
            .responseDecodable(of: Int.self) { response in
                switch response.result{
                case .success(let data):
                    observer.onNext(data)
                case .failure(let error):
                    print(error)
                }
            }
            
            return Disposables.create()
        }
    }
 
    func getData(id:Int) -> Observable<Model>{
        let url = "http://\(self.localhost)/api/members/\(id)"
        
        return Observable<Model>.create(){ observe in
            AF.request(url,
                       method: .get,
                       headers: ["Content-type": "application/json"])
            .validate(statusCode: 200..<201)
            .responseDecodable(of: DecodingModel.self) { response in
                switch response.result{
                case .success(let data):
                    observe.onNext(Model(id: data.id ?? 0,
                                     name: data.name ?? "unknown",
                                     githubId: data.githubId ?? "",
                                     commits: data.commits ?? 0,
                                     tier: data.tier ?? "",
                                     authStep: data.authStep ?? "",
                                     profileImage: data.profileImage ?? "",
                                     rank: data.rank ?? 0,
                                     tokenAmount: data.tokenAmount ?? 0))
                case .failure(let error):
                    print(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
}
