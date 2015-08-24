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
        ranges.append(NSRange(location: 0, length: self.string.length))
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
            ranges.append(NSRange(location: 0, length: self.string.length))
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

    func matchWithOptions(substring: String, _ options: NSStringCompareOptions) -> Snake {
        let string = self.string.string as NSString
        ranges.removeAll()
        ranges.append(string.rangeOfString(substring, options: options))
        return self
    }

    func match(substring: String) -> Snake {
        return matchWithOptions(substring, nil)
    }

    func matchAllWithOptions(substring: String, _ options: NSStringCompareOptions) -> Snake {
        let string = self.string.string as NSString
        var range = string.rangeOfString(substring, options: options)
        ranges.removeAll()
        ranges.append(range)
        while range.length != 0 {
            let location = range.location + range.length
            let length = string.length - location
            range = string.rangeOfString(substring, options: options, range: NSRange(location: location, length: length))
            ranges.append(range)
        }
        return self
    }

    func matchAll(substirng: String) -> Snake {
        return matchAllWithOptions(substirng, nil)
    }

    func applyAttributes(attributeName: String, value: AnyObject) -> Snake {
        for range in self.ranges {
            self.string.addAttribute(attributeName, value: value, range: range)
        }
        return self
    }

    func color(color: UIColor) -> Snake {
        return applyAttributes(NSForegroundColorAttributeName, value: color)
    }

    func color(hex: Int) -> Snake {
        return applyAttributes(NSForegroundColorAttributeName, value: colorFrom(hex: hex))
    }

    // MARK: - Font

    func fontName(fontName: String) -> Snake {
        for range in self.ranges {
            let font = self.string.attribute(NSFontAttributeName, atIndex: 0, effectiveRange:nil) as! UIFont
            self.string.addAttribute(NSFontAttributeName, value: UIFont(name: fontName, size: font.pointSize)!, range: range)
        }
        return self
    }

    func size(size: CGFloat) -> Snake {
        for range in self.ranges {
            let font = self.string.attribute(NSFontAttributeName, atIndex: 0, effectiveRange:nil) as! UIFont
            self.string.addAttribute(NSFontAttributeName, value: UIFont(name: font.fontName, size: size)!, range: range)
        }
        return self
    }

    func font(font: UIFont) -> Snake {
        return fontName(font.fontName).size(font.pointSize)
    }

    // MARK: - Style

    var underline: Snake {
        return underline(NSUnderlineStyle.StyleSingle)
    }

    func underline(underline: NSUnderlineStyle) -> Snake {
        return applyAttributes(NSUnderlineStyleAttributeName, value: underline.rawValue)
    }

    func underline(color: UIColor) -> Snake {
        return applyAttributes(NSUnderlineColorAttributeName, value: color)
    }

    func underline(hex: Int) -> Snake {
        return applyAttributes(NSUnderlineColorAttributeName, value: colorFrom(hex: hex))
    }

    private func colorFrom(#hex: Int) -> UIColor {
        let red = CGFloat((hex & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00ff00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000ff) / 255.0
        return  UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}