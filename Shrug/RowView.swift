//
//  Row.swift
//  ShrugKeyboard
//
//  Created by Ben Yorke on 10/24/14.
//  Copyright (c) 2014 Ben Yorke. All rights reserved.
//

import UIKit

class RowView: UIView {
    var buttons: [UIButton] = []
    
    init(width: Int, height: Int) {
        super.init(frame: CGRectMake(0, 0, CGFloat(width), CGFloat(height)))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func +=(left: RowView, right: AnyObject?) {
    left.buttons.append(right! as UIButton)
    left.addSubview(right! as UIButton)
}