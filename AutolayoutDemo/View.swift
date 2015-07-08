//
//  View.swift
//  AutolayoutDemo
//
//  Created by Stephen Yao on 27/12/2014.
//  Copyright (c) 2014 SilverBear. All rights reserved.
//

import UIKit

class View: UIView {
    
    var blueView : UIView?
    var redView : UIView?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
//        setupViewWithVisualFormat()
        setupViewWithConveninceMethods()
        
    }
    
    func setupView() {
        self.blueView = UIView()
        self.blueView?.backgroundColor = UIColor.blueColor()
        self.blueView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.addSubview(self.blueView!)
        
        let blueViewCenterXConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        
        let blueViewCenterYConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        
        let blueViewWidthConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 200)
        
        let blueViewHeightConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 200)
        
        self.addConstraints([blueViewCenterXConstraint,blueViewCenterYConstraint,blueViewWidthConstraint,blueViewHeightConstraint])
        
        self.redView = UIView()
        self.redView?.backgroundColor = UIColor.redColor()
        self.redView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.addSubview(self.redView!)
        
        let redViewCenterXConstraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.blueView!, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        
        let redViewBottomConstraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.blueView!, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        
        let redViewWidthConstraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100)
        
        let redViewHeightConstraint = NSLayoutConstraint(item: self.redView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100)
        
        self.addConstraints([redViewCenterXConstraint,redViewBottomConstraint,redViewWidthConstraint,redViewHeightConstraint])
    }

    func setupViewWithVisualFormat() {
        self.blueView = UIView()
        self.blueView?.backgroundColor = UIColor.blueColor()
        self.blueView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.blueView!)
        
        self.redView = UIView()
        self.redView?.backgroundColor = UIColor.redColor()
        self.redView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.redView!)

        let views = [
            "redView" : self.redView!,
            "blueView" : self.blueView!
        ]
        
        let redViewHorizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[redView(100)]", options: nil, metrics: nil, views: views)
        
        let blueViewHorizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[blueView(200)]", options: nil, metrics: nil, views: views)
        let blueViewCenterXConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        let blueViewCenterYConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        
        let redViewVerticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[redView(100)]", options: nil, metrics: nil, views: views)
        let blueViewVerticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[blueView(200)]", options: nil, metrics: nil, views: views)
        
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[redView(100)]-0-[blueView(200)]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: views)
        
        self.addConstraints(redViewHorizontalConstraint)
        self.addConstraints(blueViewHorizontalConstraint)
        self.addConstraint(blueViewCenterXConstraint)
        self.addConstraint(blueViewCenterYConstraint)
        
        self.addConstraints(verticalConstraint)
    }
    
    func setupViewWithConveninceMethods() {
        self.blueView = UIView()
        self.blueView?.backgroundColor = UIColor.blueColor()
        self.blueView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.blueView!)
        
        self.redView = UIView()
        self.redView?.backgroundColor = UIColor.redColor()
        self.redView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.redView!)
        
        self.addConstraints(self.blueView!.centerHorizontallyTo(self))
        self.addConstraints(self.blueView!.centerVerticallyTo(self))
        self.addConstraints(self.blueView!.constrainHeight(200))
        self.addConstraints(self.blueView!.constrainWidth(200))
        
        self.addConstraints(self.redView!.anchorToTop(self.blueView!, padding: 0))
        self.addConstraints(self.redView!.centerHorizontallyTo(self.blueView!))
        self.addConstraints(self.redView!.constrainWidth(100))
        self.addConstraints(self.redView!.constrainHeight(100))
    }
    
}
