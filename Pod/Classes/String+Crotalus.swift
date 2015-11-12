//
//  String+Crotalus.swift
//  Crotalus
//
//  Created by Draveness on 21/8/15.
//  Copyright (c) 2015 Draveness. All rights reserved.
//

import UIKit
import ObjectiveC

private var CrotalusAssociatedKey = "CrotalusAssociatedKey"

public extension String {
    
    public var crotalus: Crotalus {
        get {
            var crotalus: Crotalus! = objc_getAssociatedObject(self, &CrotalusAssociatedKey) as? Crotalus
            if let crotalus = crotalus {
                return crotalus
            } else {
                crotalus = Crotalus(self)
                objc_setAssociatedObject(self, &CrotalusAssociatedKey, crotalus, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return crotalus
            }
        }
    }
    
    public var black: NSMutableAttributedString {
        get {
            return self.crotalus.black.string
        }
    }
    public var darkGray: NSMutableAttributedString {
        get {
            return self.crotalus.darkGray.string
        }
    }
    public var lightGray: NSMutableAttributedString {
        get {
            return self.crotalus.lightGray.string
        }
    }
    public var white: NSMutableAttributedString {
        get {
            return self.crotalus.white.string
        }
    }
    public var gray: NSMutableAttributedString {
        get {
            return self.crotalus.gray.string
        }
    }
    public var red: NSMutableAttributedString {
        get {
            return self.crotalus.red.string
        }
    }
    public var green: NSMutableAttributedString {
        get {
            return self.crotalus.green.string
        }
    }
    public var blue: NSMutableAttributedString {
        get {
            return self.crotalus.blue.string
        }
    }
    public var cyan: NSMutableAttributedString {
        get {
            return self.crotalus.cyan.string
        }
    }
    public var yellow: NSMutableAttributedString {
        get {
            return self.crotalus.yellow.string
        }
    }
    public var magenta: NSMutableAttributedString {
        get {
            return self.crotalus.magenta.string
        }
    }
    public var orange: NSMutableAttributedString {
        get {
            return self.crotalus.orange.string
        }
    }
    public var purple: NSMutableAttributedString {
        get {
            return self.crotalus.purple.string
        }
    }
    public var brown: NSMutableAttributedString {
        get {
            return self.crotalus.brown.string
        }
    }
    public var clear: NSMutableAttributedString {
        get {
            return self.crotalus.clear.string
        }
    }
    public func color(color: UIColor) -> NSMutableAttributedString {
        return self.crotalus.color(color).string
    }
    public func color(hex: Int) -> NSMutableAttributedString {
        return self.crotalus.color(hex).string
    }
    
}
