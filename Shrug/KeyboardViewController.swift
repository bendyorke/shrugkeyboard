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
        self.view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        addRows()
        addButtonsToRows()
        placeRows()
    }


    func addRows() {
        for i in (0...3) {
            let row = RowView(width: 320, height: 50)
            self.rows.append(row)
            self.view.addSubview(row)
        }
    }

    func addButtonsToRows() {
        self.rows[0].setKeys(keys: [
            Key(title: "¯\\_(ツ)_/¯", input: self, width: 60),
            Key(title: "(•_•)", input: self, width: 35),
            Key(title: "( •_•)>⌐■-■", input: self, width: 90),
            Key(title: "(⌐■_■)", input: self, width: 60),
            Key(title: "\\(´Д｀)/", input: self, width: 55)
        ])
        self.rows[1].setKeys(keys: [
            Key(title: "ˁ˚ᴥ˚ˀ", input: self, width: 30),
            Key(title: "ʕ•ᴥ•ʔ", input: self, width: 40),
            Key(title: "ᕙ(⇀Д↼‶)ᕗ", input: self, width: 80),
            Key(title: "ʘ‿ʘ", input: self, width: 40),
            Key(title: "( ͡° ͜ʖ ͡°)", input: self, width: 50)
        ])
        self.rows[2].setKeys(keys: [
            Key(title: "(╯°□°）╯︵┻━┻", input: self, width: 140),
            Key(title: "ಠ_ಠ", input: self, width: 35),
            Key(title: "ಥ﹏ಥ", input: self, width: 45),
            Key(title: "ಠ╭╮ಠ", input: self, width: 55)
        ])
        self.rows[3].setKeys(keys: [
            Key(title: "🌐", input: self, width: 60),
            Key(title: "Space", input: self),
            Key(title: "Return", input: self, width: 60),
            Key(title: "⌫", input: self, width: 60)
            ], spacers: false)
    }

    func placeRows() {
        for (index, row) in enumerate(self.rows) {
            row.constrainTo(self, position: index)
        }
    }

    func didTapButton(sender: AnyObject?) {
        let button = sender as! UIButton
        let title = button.titleForState(.Normal)!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        var proxy = textDocumentProxy as! UITextDocumentProxy

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
        var proxy = self.textDocumentProxy as! UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
    }

}
