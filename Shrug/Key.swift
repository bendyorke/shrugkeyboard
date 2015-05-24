//
//  Key.swift
//  Shrugboard
//
//  Created by Ben Yorke on 1/17/15.
//  Copyright (c) 2015 Ben Yorke. All rights reserved.
//

import UIKit

class Key {
    
    var button: UIButton = UIButton.buttonWithType(.System) as! UIButton
    var width: Int = 0
    
    var spacer: Bool {
        return self.button.titleLabel!.text == ""
    }
    
    init(title: String) {
        self.button.setTitle(title, forState: .Normal)
        self.button.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        self.button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        self.button.titleLabel?.textAlignment = NSTextAlignment.Center
    }
    
    convenience init(title: String, input: UIInputViewController) {
        self.init(title: title)
        self.button.addTarget(input, action: "didTapButton:", forControlEvents: .TouchUpInside)
    }
    
    convenience init(title: String, input: UIInputViewController, width: Int) {
        self.init(title: title, input: input)
        self.width = width
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constrainTo(parent: RowView, position: Int) {
        if(self.width == 0) {
            constrainAsSpacerTo(parent, position: position)
        } else {
            constrainAsKeyTo(parent, position: position)
        }
    }
    
    func constrainAsKeyTo(parent: RowView, position: Int) {
        let n = parent.keys[position + 1].button
        let p = parent.keys[position - 1].button
        let w = NSLayoutConstraint(item: self.button, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: CGFloat(width))
        let b = NSLayoutConstraint(item: self.button, attribute: .Bottom, relatedBy: .Equal, toItem: parent, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let t = NSLayoutConstraint(item: self.button, attribute: .Top, relatedBy: .Equal, toItem: parent, attribute: .Top, multiplier: 1.0, constant: 0)
        let l = NSLayoutConstraint(item: self.button, attribute: .Left, relatedBy: .Equal, toItem: p, attribute: .Right, multiplier: 1.0, constant: 0)
        let r = NSLayoutConstraint(item: self.button, attribute: .Right, relatedBy: .Equal, toItem: n, attribute: .Left, multiplier: 1.0, constant: 0)

        parent.addConstraints([w, b, t, l, r])
    }
    
    func constrainAsSpacerTo(parent: RowView, position: Int) {
        let h = NSLayoutConstraint(item: self.button, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 0)

        if(position == 0) {
            let l = NSLayoutConstraint(item: self.button, attribute: .Left, relatedBy: .Equal, toItem: parent, attribute: .Left, multiplier: 1.0, constant: 0)
            parent.addConstraint(l)
        } else {
            let n = parent.keys[position - 2].button
            let w = NSLayoutConstraint(item: self.button, attribute: .Width, relatedBy: .Equal, toItem: n, attribute: .Width, multiplier: 1.0, constant: 0)
            parent.addConstraint(w)
        }
        
        if(position == parent.keys.count - 1) {
            let r = NSLayoutConstraint(item: self.button, attribute: .Right, relatedBy: .Equal, toItem: parent, attribute: .Right, multiplier: 1.0, constant: 0)
            parent.addConstraint(r)
        }

        parent.addConstraints([h])
    }
    
    func constrainWithSingleSpacerTo(parent: RowView, position: Int) {
        let b = NSLayoutConstraint(item: self.button, attribute: .Bottom, relatedBy: .Equal, toItem: parent, attribute: .Bottom, multiplier: 1.0, constant: 0)
        var r = NSLayoutConstraint(item: self.button, attribute: .Right, relatedBy: .Equal, toItem: parent, attribute: .Right, multiplier: 1.0, constant: 0)
        var l = NSLayoutConstraint(item: self.button, attribute: .Left, relatedBy: .Equal, toItem: parent, attribute: .Left, multiplier: 1.0, constant: 0)
        let t = NSLayoutConstraint(item: self.button, attribute: .Top, relatedBy: .Equal, toItem: parent, attribute: .Top, multiplier: 1.0, constant: 0)
        
        
        if position != 0 {
            l = NSLayoutConstraint(item: self.button, attribute: .Left, relatedBy: .Equal, toItem: parent.keys[position - 1].button, attribute: .Right, multiplier: 1.0, constant: 0)
        }
        
        if position != parent.keys.count - 1 {
            r = NSLayoutConstraint(item: self.button, attribute: .Right, relatedBy: .Equal, toItem: parent.keys[position + 1].button, attribute: .Left, multiplier: 1.0, constant: 0)
        }
        
        if self.width > 0 {
            parent.addConstraint(NSLayoutConstraint(item: self.button, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: CGFloat(width)))
        }
        
        parent.addConstraints([t, r, b, l])

    }
}























