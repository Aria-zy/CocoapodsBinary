//
//  ViewController.swift
//  CocoapodsBinary
//
//  Created by 小五 on 2019/10/12.
//  Copyright © 2019 小五. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        redView.snp.makeConstraints({ (maker) in
            maker.center.equalToSuperview()
            maker.size.equalTo(100)
        })
        return redView
    }()

    private lazy var blueView: UIView = {
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)
        blueView.snp.makeConstraints({ (maker) in
            maker.leading.size.equalTo(redView)
            maker.top.equalTo(100)
        })
        return blueView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        _ = redView
        _ = blueView
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 闪退测试
        blueView.snp.updateConstraints { (maker) in
            maker.top.equalTo(redView.snp_bottom).offset(10)
        }
    }
}

