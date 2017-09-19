//
//  ViewController.swift
//  CountRx
//
//  Created by ShinokiRyosei on 2017/09/19.
//  Copyright © 2017年 ShinokiRyosei. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var plusButton: UIButton!

    var number: Int = 0

    let disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        plusButton.rx.tap.asObservable().map ({ [weak self] _ -> Int in

            guard let `self` = self else {

                return 0
            }
            self.number = self.number + 1
            return self.number
        })
            .map({ String($0) })
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

