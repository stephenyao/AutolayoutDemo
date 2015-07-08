//
//  UIViewAutoLayoutExtension.swift
//  AutolayoutDemo
//
//  Created by Stephen Yao on 8/07/2015.
//  Copyright (c) 2015 SilverBear. All rights reserved.
//
import UIKit

extension NSLayoutConstraint {
    class func constraintsWithVisualFormat(visualFormat: String, views: [NSObject : AnyObject]) -> [AnyObject] {
        return NSLayoutConstraint.constraintsWithVisualFormat(visualFormat, options: nil, metrics: nil, views: views)
    }
    
    class func constraintsWithVisualFormat(visualFormat: String,  metrics: [NSObject : AnyObject]?, views: [NSObject : AnyObject]) -> [AnyObject] {
        return NSLayoutConstraint.constraintsWithVisualFormat(visualFormat, options: nil, metrics: metrics, views: views)
    }
    
    class func constraintsWithVisualFormat(visualFormat: String,  options: NSLayoutFormatOptions, views: [NSObject : AnyObject]) -> [AnyObject] {
        return NSLayoutConstraint.constraintsWithVisualFormat(visualFormat, options: options, metrics: nil, views: views)
    }
}

extension UIView {
    
    // Given an item, stretches the width and height of the view to the toItem.
    func  stretchToBoundsOfSuperView() -> [NSLayoutConstraint] {
        var constraints =
        NSLayoutConstraint.constraintsWithVisualFormat("H:|[item]|", options: nil, metrics: nil, views: ["item" : self]) +
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[item]|", options: nil, metrics: nil, views: ["item" : self])
        if let superview = self.superview {
            superview.addConstraints(constraints)
        }
        return constraints as! [NSLayoutConstraint]
    }
    
    func alignTopTo(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
        var constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: padding)
        self.superview?.addConstraint(constraint)
        return [constraint]
    }
    
    func centerHorizontallyTo(toItem: UIView) -> [NSLayoutConstraint] {
        return self.centerHorizontallyTo(toItem, padding: 0)
    }
    
    func centerHorizontallyTo(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
        let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: padding)
        self.superview?.addConstraint(constraint)
        return [constraint]
    }
    
    func centerVerticallyTo(toItem: UIView) -> [NSLayoutConstraint] {
        return self.centerVerticallyTo(toItem, padding: 0)
    }
    
    func centerVerticallyTo(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
        let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: padding)
        self.superview?.addConstraint(constraint)
        return [constraint]
    }
    
    func stretchToWidthOfSuperView() -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[item]|", options: nil, metrics: nil, views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func stretchToWidthOfSuperView(padding: CGFloat) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-padding-[item]-padding-|", options: nil, metrics: ["padding" : padding], views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func stretchToHeightOfSuperView() -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[item]|", options: nil, metrics: nil, views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func stretchToHeightOfSuperView(padding: CGFloat) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-padding-[item]-padding-|", options: nil, metrics: ["padding" : padding], views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func constrainToTopOfSuperView(padding: CGFloat) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-padding-[item]", options: nil, metrics: ["padding" : padding], views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func constrainToLeftOfSuperView(padding: CGFloat) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-padding-[item]", options: nil, metrics: ["padding" : padding], views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func constrainToBottomOfSuperView(padding: CGFloat) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[item]-padding-|", options: nil, metrics: ["padding" : padding], views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func constrainToRightOfSuperView(padding: CGFloat) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:[item]-padding-|", options: nil, metrics: ["padding" : padding], views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func constrainWidth(width: CGFloat) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:[item(width)]", metrics: ["width" : width], views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func constrainHeight(height: CGFloat) -> [NSLayoutConstraint] {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[item(height)]", metrics: ["height" : height], views: ["item" : self])
        self.superview?.addConstraints(constraints)
        return constraints as! [NSLayoutConstraint]
    }
    
    func constrainWidthTo(toItem: UIView) -> [NSLayoutConstraint] {
        var constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0)
        self.superview?.addConstraint(constraint)
        return [constraint]
    }
    
    func constrainHeightTo(toItem: UIView) -> [NSLayoutConstraint] {
        var constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0)
        self.superview?.addConstraint(constraint)
        return [constraint]
    }
    
    func anchorToBottom(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
        let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: padding)
        
        self.superview?.addConstraint(constraint)
        return [constraint]
    }
    
    func anchorToRight(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
        let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: padding)
        
        self.superview?.addConstraint(constraint)
        return [constraint]
    }
    
    func anchorToTop(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
        let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: -padding)
        
        self.superview?.addConstraint(constraint)
        return [constraint]
    }
    func anchorToLeft(toItem: UIView, padding: CGFloat) -> [NSLayoutConstraint] {
        let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: toItem, attribute: NSLayoutAttribute.Left , multiplier: 1.0, constant: -padding)
        
        self.superview?.addConstraint(constraint)
        return [constraint]
    }
}