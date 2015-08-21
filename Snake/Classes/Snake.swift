//
//  Snake.swift
//  Snake
//
//  Created by Draveness on 21/8/15.
//  Copyright (c) 2015 Draveness. All rights reserved.
//

import UIKit

class Snake {
    
    let string: NSMutableAttributedString
    private var ranges: [NSRange] = []

    init(_ string: NSMutableAttributedString) {
        self.string = string
        self.ranges.append(NSRangeFromString(self.string.string))
    }
    
    convenience init(_ string: NSAttributedString) {
        self.init(NSMutableAttributedString(attributedString: string))
    }
    
    convenience init(_ string: NSString) {
        self.init(NSMutableAttributedString(string: string as String))
    }
    
    convenience init(_ string: String) {
        self.init(NSMutableAttributedString(string: string))
    }
    
    var all: Snake {
        get {
            ranges.removeAll()
            ranges.append(NSRangeFromString(self.string.string))
            return self
        }
    }
    
    func range(from: Int, to: Int) -> Snake {
        ranges.removeAll()
        ranges.append(NSRange(location: from, length: to - from))
        return self
    }
    func range(location: Int, length: Int) -> Snake {
        ranges.removeAll()
        ranges.append(NSRange(location: location, length: length))
        return self
    }
    func range(range: NSRange) -> Snake {
        ranges.removeAll()
        ranges.append(range)
        return self
    }

    
}
