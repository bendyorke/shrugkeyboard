//
//  KeyboardViewController.swift
//  Shrug
//
//  Created by Ben Yorke on 10/19/14.
//  Copyright (c) 2014 Ben Yorke. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var rows: [RowView] = []
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRows()
        addButtons()
        placeRows()
    }
    
    func addRows() {
        for i in (0...3) {
            self.rows.append(RowView(width: 320, height: 50))
        }
    }
    
    func addButtons() {
        button("¯\\_(ツ)_/¯", row: 0)
        button("(•_•)", row: 0)
        button("( •_•)>⌐■-■", row: 0)
        button("(⌐■_■)", row: 0)
        button("\\(´Д｀)/", row: 0)
        button(" ˁ˚ᴥ˚ˀ ", row: 1)
        button(" ʕ•ᴥ•ʔ ", row: 1)
        button(" ᕙ(⇀Д↼‶)ᕗ ", row: 1)
        button("(╬ ಠ益ಠ)", row: 1)
        button("( ͡° ͜ʖ ͡°)", row: 1)
        button(" (╯°□°）╯︵ ┻━┻ ", row: 2)
        button("(ಠ_ಠ)", row: 2)
        button(" ʘ‿ʘ ", row: 2)
        button(" ಠ╭╮ಠ ", row: 2)
        button("  🌐  ", row: 3)
        button("Space", row: 3)
        button(" Return ", row: 3)
        button("  ⌫  ", row: 3)
    }
    
    func placeRows() {
        for (index, row) in enumerate(self.rows) {
            self.view.addSubview(row)
            constrainButtons(row.buttons, mainView: row, rowIndex: index)
            row.setTranslatesAutoresizingMaskIntoConstraints(false)
        }
        constrainRows(self.view, rowViews: self.rows)
    }
    
    func constrainButtons(buttons: [UIButton], mainView: RowView, rowIndex: Int){
        
        for (index, button) in enumerate(buttons) {
            
            var length = countElements(button.titleLabel!.text!)
            
            var topConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: mainView, attribute: .Top, multiplier: 1.0, constant: 0)
            
            var bottomConstraint = NSLayoutConstraint(item: button, attribute: .Bottom, relatedBy: .Equal, toItem: mainView, attribute: .Bottom, multiplier: 1.0, constant: 0)
            
            var rightConstraint : NSLayoutConstraint!
            
            if index == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: mainView, attribute: .Right, multiplier: 1.0, constant: 0)
                
            }else{
                
                let nextButton = buttons[index+1]
                rightConstraint = NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: nextButton, attribute: .Left, multiplier: 1.0, constant: 0)
            }
            
            
            var leftConstraint : NSLayoutConstraint!
            
            if index == 0 {
                
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: mainView, attribute: .Left, multiplier: 1.0, constant: 0)
                
            }else{
                
                let prevtButton = buttons[index-1]
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: prevtButton, attribute: .Right, multiplier: 1.0, constant: 0)
                
                let firstButton = buttons[0]
            }
            
            if ((rowIndex == 0 && index != 1) ||
                (rowIndex == 1 && index != 3) ||
                (rowIndex == 2 && index != 0) ||
                (rowIndex == 3 && index != 1)) {
                    var widthConstraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: CGFloat(length * 10))
                    
                    mainView.addConstraint(widthConstraint)
            }
            
            mainView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    func constrainRows(inputView: UIView, rowViews: [RowView]){
        
        for (index, rowView) in enumerate(rowViews) {
            var rightSideConstraint = NSLayoutConstraint(item: rowView, attribute: .Right, relatedBy: .Equal, toItem: inputView, attribute: .Right, multiplier: 1.0, constant: 0)
            
            var leftConstraint = NSLayoutConstraint(item: rowView, attribute: .Left, relatedBy: .Equal, toItem: inputView, attribute: .Left, multiplier: 1.0, constant: 0)
            
            inputView.addConstraints([leftConstraint, rightSideConstraint])
            
            var topConstraint: NSLayoutConstraint
            
            if index == 0 {
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .Top, relatedBy: .Equal, toItem: inputView, attribute: .Top, multiplier: 1.0, constant: 1)
                
            }else{
                
                let prevRow = rowViews[index-1]
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .Top, relatedBy: .Equal, toItem: prevRow, attribute: .Bottom, multiplier: 1.0, constant: 0)
                
                let firstRow = rowViews[0]
                var heightConstraint = NSLayoutConstraint(item: firstRow, attribute: .Height, relatedBy: .Equal, toItem: rowView, attribute: .Height, multiplier: 1.0, constant: 0)
                
                inputView.addConstraint(heightConstraint)
            }
            inputView.addConstraint(topConstraint)
            
            var bottomConstraint: NSLayoutConstraint
            
            if index == rowViews.count - 1 {
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .Bottom, relatedBy: .Equal, toItem: inputView, attribute: .Bottom, multiplier: 1.0, constant: 0)
                
            }else{
                
                let nextRow = rowViews[index+1]
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .Bottom, relatedBy: .Equal, toItem: nextRow, attribute: .Top, multiplier: 1.0, constant: 0)
            }
            
            inputView.addConstraint(bottomConstraint)
        }
        
    }
    
    func didTapButton(sender: AnyObject?) {
        let button = sender as UIButton
        let title = button.titleForState(.Normal)!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        switch title {
        case "⌫" :
            proxy.deleteBackward()
        case "Return" :
            proxy.insertText("\n")
        case "Space" :
            proxy.insertText(" ")
        case "🌐" :
            self.advanceToNextInputMode()
        default :
            proxy.insertText(title)
        }
    }
    
    func button(title: String, row index: Int) {
        var button = UIButton.buttonWithType(.System) as UIButton
        button.setTitle(title, forState: .Normal)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        button.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
        self.rows[index] += button
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
    }
    
}
