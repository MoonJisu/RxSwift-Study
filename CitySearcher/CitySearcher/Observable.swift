//
//  Observable.swift
//  CitySearcher
//
//  Created by 문지수 on 2020/08/27.
//  Copyright © 2020 문지수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class Observable: ViewController {
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        searchBar
            .rx.text
            .orEmpty
            .subscribe(onNext: { [unowned self] query in
                  print("query: \(query)")
                  self.showCitys = self.citys.filter({ $0.hasPrefix(query) })
                  self.tableView.reloadData()
                })
                .disposed(by: disposeBag)
            }
}
