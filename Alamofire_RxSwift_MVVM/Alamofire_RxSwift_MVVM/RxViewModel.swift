//
//  RxViewModel.swift
//  Alamofire_RxSwift_MVVM
//
//  Created by 정호진 on 2023/03/05.
//

import Foundation
import RxSwift

class RxViewModel{
    let disposeBag = DisposeBag()
    
    func binding() -> Observable<Model>{
        return Observable<Model>.create(){ observer in
            RxService.escape.postData()
                .subscribe(onNext: { data in
                    RxService.escape.getData(id: data).subscribe(onNext: { info in
                        print(info)
                        observer.onNext(info)
                    })
                    .disposed(by: self.disposeBag)
                })
                .disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
 
}
