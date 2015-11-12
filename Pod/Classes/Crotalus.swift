//
//  Crotalus.swift
//  Crotalus
//
//  Created by Draveness on 21/8/15.
//  Copyright (c) 2015 Draveness. All rights reserved.
//

import UIKit

public class Crotalus {
    
    public let string: NSMutableAttributedString
    private var ranges: [NSRange] = []
    
    public init(_ string: NSMutableAttributedString) {
        self.string = string
        ranges.append(NSRange(location: 0, length: self.string.length))
    }
    
    public convenience init(_ string: NSAttributedString) {
        self.init(NSMutableAttributedString(attributedString: string))
    }
    
    public convenience init(_ string: NSString) {
        self.init(NSMutableAttributedString(string: string as String))
    }
    
    public convenience init(_ string: String) {
        self.init(NSMutableAttributedString(string: string))
    }
    
    public var all: Crotalus {
        get {
            ranges.removeAll()
            ranges.append(NSRange(location: 0, length: self.string.length))
            return self
        }
    }
    
    public func range(from: Int, to: Int) -> Crotalus {
        ranges.removeAll()
        ranges.append(NSRange(location: from, length: to - from))
        return self
    }
    
    public func range(location: Int, length: Int) -> Crotalus {
        ranges.removeAll()
        ranges.append(NSRange(location: location, length: length))
        return self
    }
    
    public func range(range: NSRange) -> Crotalus {
        ranges.removeAll()
        ranges.append(range)
        return self
    }
    
    public func matchWithOptions(substring: String, _ options: NSStringCompareOptions = .LiteralSearch) -> Crotalus {
        let string = self.string.string as NSString
        ranges.removeAll()
        ranges.append(string.rangeOfString(substring, options: options))
        return self
    }
    
    public func match(substring: String) -> Crotalus {
        return matchWithOptions(substring)
    }
    
    public func matchAllWithOptions(substring: String, _ options: NSStringCompareOptions = .LiteralSearch) -> Crotalus {
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
    
    public func matchAll(substirng: String) -> Crotalus {
        return matchAllWithOptions(substirng)
    }
    
    public func color(color: UIColor) -> Crotalus {
        return applyAttributes(NSForegroundColorAttributeName, value: color)
    }
    
    public func color(hex: Int) -> Crotalus {
        return applyAttributes(NSForegroundColorAttributeName, value: colorFrom(hex: hex))
    }
    
    public var black: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.blackColor())
        }
    }
    public var darkGray: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.darkGrayColor())
        }
    }
    public var lightGray: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.lightGrayColor())
        }
    }
    public var white: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.whiteColor())
        }
    }
    public var gray: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.grayColor())
        }
    }
    public var red: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.redColor())
        }
    }
    public var green: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.greenColor())
        }
    }
    public var blue: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.blueColor())
        }
    }
    public var cyan: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.cyanColor())
        }
    }
    public var yellow: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.yellowColor())
        }
    }
    public var magenta: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.magentaColor())
        }
    }
    public var orange: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.orangeColor())
        }
    }
    public var purple: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.purpleColor())
        }
    }
    public var brown: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.brownColor())
        }
    }
    public var clear: Crotalus {
        get {
            return applyAttributes(NSForegroundColorAttributeName, value: UIColor.clearColor())
        }
    }
    
    // MARK: - Font
    
    public func fontName(fontName: String) -> Crotalus {
        for range in self.ranges {
            if let font = self.string.attribute(NSFontAttributeName, atIndex: 0, effectiveRange:nil) as? UIFont {
                if let currentFont = UIFont(name: fontName, size: font.pointSize) {
                    self.string.addAttribute(NSFontAttributeName, value: currentFont, range: range)
                }
            } else {
                if let currentFont = UIFont(name: fontName, size: UIFont.systemFontSize()) {
                    self.string.addAttribute(NSFontAttributeName, value: currentFont, range: range)
                }
            }
        }
        return self
    }
    
    public func size(size: CGFloat) -> Crotalus {
        for range in self.ranges {
            if let font = self.string.attribute(NSFontAttributeName, atIndex: 0, effectiveRange:nil) as? UIFont {
                self.string.addAttribute(NSFontAttributeName, value: UIFont(name: font.fontName, size: size)!, range: range)
            } else {
                self.string.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(size), range: range)
            }
        }
        return self
    }
    
    public func font(font: UIFont) -> Crotalus {
        return fontName(font.fontName).size(font.pointSize)
    }
    
    // MARK: - Style
    
    public var underline: Crotalus {
        return underline(NSUnderlineStyle.StyleSingle)
    }
    
    public func underline(underline: NSUnderlineStyle) -> Crotalus {
        return applyAttributes(NSUnderlineStyleAttributeName, value: underline.rawValue)
    }
    
    public func underline(color: UIColor) -> Crotalus {
        return applyAttributes(NSUnderlineColorAttributeName, value: color)
    }
    
    public func underline(hex: Int) -> Crotalus {
        return applyAttributes(NSUnderlineColorAttributeName, value: colorFrom(hex: hex))
    }
    
    public func attach(image: UIImage?) -> Crotalus {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        string.appendAttributedString(NSAttributedString(attachment: imageAttachment))
        return self
    }
    
    public func attach(imageStr: String) -> Crotalus {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: imageStr)
        string.appendAttributedString(NSAttributedString(attachment: imageAttachment))
        return self
    }
    
    public func shadow(shadow: NSShadow) -> Crotalus {
        return applyAttributes(NSShadowAttributeName, value: shadow)
    }
    
    public func link(link: NSURL) -> Crotalus {
        return applyAttributes(NSLinkAttributeName, value: link)
    }
    
    public func link(link: NSString) -> Crotalus {
        return applyAttributes(NSLinkAttributeName, value: link)
    }
    
    public func baselineOffset(offset: NSNumber) -> Crotalus {
        return applyAttributes(NSBaselineOffsetAttributeName, value: offset)
    }
    
    public func kern(number: NSNumber) -> Crotalus {
        return applyAttributes(NSKernAttributeName, value: number)
    }
    
    // MARK: - Private
    
    private func applyAttributes(attributeName: String, value: AnyObject) -> Crotalus {
        for range in self.ranges {
            self.string.addAttribute(attributeName, value: value, range: range)
        }
        return self
    }
    
    private func colorFrom(hex hex: Int) -> UIColor {
        let red = CGFloat((hex & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00ff00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000ff) / 255.0
        return  UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}
