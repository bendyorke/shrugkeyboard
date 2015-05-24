// Playground - noun: a place where people can play

import UIKit

let arr = [2,4,6]
let arr2 = [1,3,5,7]
var arr3:[Int] = []
for el in arr {
    arr3 += [el - 1, el]
}
arr3.append(arr3.count + 1)

UIView()


var arr4 = arr.reduce([], { $0 + [$1 - 1, $1] })
var arr5 = arr4 + [7]
arr5
// SCROLLVIEWS
//var mainView = UIView(frame: CGRectMake(0, 0, 400, 320))
//mainView.backgroundColor = UIColor.blueColor()
//
//var scrollView = UIScrollView(frame: CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height))
//scrollView.backgroundColor = UIColor.blackColor()
//
//var view1 = UIView(frame: CGRectMake(0, 0, 300, 320))
//view1.backgroundColor = UIColor.grayColor()
//
//var view2 = UIView(frame: CGRectMake(300, 0, 500, 320))
//view2.backgroundColor = UIColor.orangeColor()
//
//scrollView.addSubview(view1)
//scrollView.addSubview(view2)
//
//scrollView.scrollEnabled = true
//scrollView.showsHorizontalScrollIndicator = true
//scrollView.userInteractionEnabled = true
//scrollView.pagingEnabled = true
//
//
//scrollView.contentSize = CGSizeMake(800, 320)
//
//mainView.addSubview(scrollView)
//
//mainView.subviews
//
//scrollView.frame.size.height
//scrollView.frame.size.width
//
//println("hello")
//
//mainView

//  NSCONTRAINTS
//func constrainScrollView(scrollView: UIScrollView, mainView: UIView) {
//    //        let rightConstraint = NSLayoutConstraint(item: scrollView, attribute: .Right, relatedBy: .Equal, toItem: mainView, attribute: .Right, multiplier: 1.0, constant: 1.0)
//    let leftConstraint = NSLayoutConstraint(item: scrollView, attribute: .Left, relatedBy: .Equal, toItem: mainView, attribute: .Left, multiplier: 1.0, constant: 0)
//    let topConstraint = NSLayoutConstraint(item: scrollView, attribute: .Top, relatedBy: .Equal, toItem: mainView, attribute: .Top, multiplier: 1.0, constant: 0)
//    //        let bottomConstraint = NSLayoutConstraint(item: scrollView, attribute: .Bottom, relatedBy: .Equal, toItem: mainView, attribute: .Bottom, multiplier: -1.0, constant: 0)
//    let heightConstraint = NSLayoutConstraint(item: scrollView, attribute: .Width, relatedBy: .Equal, toItem: mainView, attribute: .Width, multiplier: 1.0, constant: 0)
//    let widthConstraint = NSLayoutConstraint(item: scrollView, attribute: .Height, relatedBy: .Equal, toItem: mainView, attribute: .Height, multiplier: 1.0, constant: 0)
//    //        mainView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint, widthConstraint, heightConstraint])
//    mainView.addConstraints([topConstraint, leftConstraint, widthConstraint, heightConstraint])
//    
//}
