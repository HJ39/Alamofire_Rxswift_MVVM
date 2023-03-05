//
//  ViewController.swift
//  Alamofire_RxSwift_MVVM
//
//  Created by 정호진 on 2023/03/05.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var lablel1: UILabel!
    let rxViewModel = RxViewModel()
    let dispoesBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingData()
    }
    
    func bindingData(){
        rxViewModel.binding().subscribe(onNext: { info in
            guard let data = info.githubId else {return}
            self.lablel1.text = "\(data)"
        })
        .disposed(by: dispoesBag)
    }
}

