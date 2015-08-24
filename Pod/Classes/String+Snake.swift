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

    public var black: NSMutableAttributedString {
        get {
            return self.snake.black.string
        }
    }
    public var darkGray: NSMutableAttributedString {
        get {
            return self.snake.darkGray.string
        }
    }
    public var lightGray: NSMutableAttributedString {
        get {
            return self.snake.lightGray.string
        }
    }
    public var white: NSMutableAttributedString {
        get {
            return self.snake.white.string
        }
    }
    public var gray: NSMutableAttributedString {
        get {
            return self.snake.gray.string
        }
    }
    public var red: NSMutableAttributedString {
        get {
            return self.snake.red.string
        }
    }
    public var green: NSMutableAttributedString {
        get {
            return self.snake.green.string
        }
    }
    public var blue: NSMutableAttributedString {
        get {
            return self.snake.blue.string
        }
    }
    public var cyan: NSMutableAttributedString {
        get {
            return self.snake.cyan.string
        }
    }
    public var yellow: NSMutableAttributedString {
        get {
            return self.snake.yellow.string
        }
    }
    public var magenta: NSMutableAttributedString {
        get {
            return self.snake.magenta.string
        }
    }
    public var orange: NSMutableAttributedString {
        get {
            return self.snake.orange.string
        }
    }
    public var purple: NSMutableAttributedString {
        get {
            return self.snake.purple.string
        }
    }
    public var brown: NSMutableAttributedString {
        get {
            return self.snake.brown.string
        }
    }
    public var clear: NSMutableAttributedString {
        get {
            return self.snake.clear.string
        }
    }

}
