//
//  ViewController.swift
//  Crotalus
//
//  Created by Draveness on 08/29/2015.
//  Copyright (c) 2015 Draveness. All rights reserved.
//

import UIKit
import Crotalus

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.frame = view.frame
        view.addSubview(label)

        let image = NSTextAttachment()
        image.image = UIImage(named: "logo")
        label.attributedText = "Hello".crotalus.color(0xff0000).match("He").color(0x00ff00).all.fontName("Sanrif").string
        //        label.attributedText = "Hello".red
    }
}

