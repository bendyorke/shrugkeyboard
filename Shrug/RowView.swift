//
//  Row.swift
//  ShrugKeyboard
//
//  Created by Ben Yorke on 10/24/14.
//  Copyright (c) 2014 Ben Yorke. All rights reserved.
//

import UIKit

class RowView: UIView {
    var keys: [Key] = []
    
    init(width: Int, height: Int) {
        super.init(frame: CGRectMake(0, 0, CGFloat(width), CGFloat(height)))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setKeys(keys newKeys: [Key], spacers: Bool = true) {
        if(spacers) {
            let keysWithSpacers = newKeys.reduce([]) { $0 + [Key(title: ""), $1] } as [Key]
            self.keys = keysWithSpacers + [Key(title: "")]
        } else {
            self.keys = newKeys
        }
        for key in self.keys { self.addSubview(key.button as UIButton) }
    }
    
    func constrainTo(parent: KeyboardViewController, position: Int) {
        if(position == parent.rows.count - 1) {
            for (index, key) in enumerate(self.keys) { key.constrainWithSingleSpacerTo(self, position: index) }
        } else {
            for (index, key) in enumerate(self.keys) { key.constrainTo(self, position: index) }
        }
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var b = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: parent.view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let r = NSLayoutConstraint(item: self, attribute: .Right, relatedBy: .Equal, toItem: parent.view, attribute: .Right, multiplier: 1.0, constant: 0)
        let l = NSLayoutConstraint(item: self, attribute: .Left, relatedBy: .Equal, toItem: parent.view, attribute: .Left, multiplier: 1.0, constant: 0)
        var t = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: parent.view, attribute: .Top, multiplier: 1.0, constant: 1)
        
        if position != 0 {
            t = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: parent.rows[position - 1], attribute: .Bottom, multiplier: 1.0, constant: 0)
            // Set Height
            parent.view.addConstraint(NSLayoutConstraint(item: parent.rows[0], attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1.0, constant: 0))
        }

        if position != 3 {
            let next = parent.rows[position + 1]
            b = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: next, attribute: .Top, multiplier: 1.0, constant: 0)
        }
        
        parent.view.addConstraints([t, r, b, l])
    }
}
