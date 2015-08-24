//
//  String+Snake.swift
//  Snake
//
//  Created by Draveness on 21/8/15.
//  Copyright (c) 2015 Draveness. All rights reserved.
//

import UIKit
import ObjectiveC

private var snakeAssociatedKey = "snakeAssociatedKey"

public extension String {
    
    public var snake: Snake {
        get {
            var snake: Snake! = objc_getAssociatedObject(self, &snakeAssociatedKey) as? Snake
            if let snake = snake {
                return snake
            } else {
                snake = Snake(self)
                objc_setAssociatedObject(self, &snakeAssociatedKey, snake, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
                return snake
            }
        }
    }
}
