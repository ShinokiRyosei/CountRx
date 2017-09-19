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

        plusButton.rx.tap.asObservable().subscribe { [weak self] event in

            guard let `self` = self else {

                return
            }
            self.number += 1
            self.label.text = "\(self.number)"
        }.disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

