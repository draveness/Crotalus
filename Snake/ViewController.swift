//
//  ViewController.swift
//  Snake
//
//  Created by Draveness on 21/8/15.
//  Copyright (c) 2015 Draveness. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: self.view.frame)
        view.addSubview(label)
        label.textAlignment = .Center
        label.attributedText = "HelloHe".snake.match("He").color(0xff0000).string
    }

}

