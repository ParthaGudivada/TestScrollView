//
//  ScrollViewController.swift
//  TestScrollView
//
//  Created by Partha Gudivada on 5/28/15.
//  Copyright (c) 2015 Partha Gudivada. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController
{
    var scrollView : UIScrollView?
    var contentView : UIView?
    var firstNameLbl : UILabel?
    var firstNameTxt : UITextField?
    var middleNameLbl : UILabel?
    var middleNameTxt : UITextField?
    var lastNameLbl : UILabel?
    var lastNameTxt : UITextField?
    var emailLbl : UILabel?
    var emailTxt : UITextField?
    var passwordLbl : UILabel?
    var passwordTxt : UITextField?
    var passwordConfirmationLbl : UILabel?
    var passwordConfirmationTxt : UITextField?
    
    
    private weak var activeField : UITextField?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let custButton  = {(btnName : String, normalColor : UIColor, disabledColor : UIColor, normalFont : UIFont, view : UIView) -> UIButton in
            let baseButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
            baseButton.setTranslatesAutoresizingMaskIntoConstraints(false)
            view.addSubview(baseButton)
            baseButton.setTitle(btnName, forState: UIControlState.Normal)
            baseButton.setTitleColor(normalColor, forState: UIControlState.Normal)
            baseButton.setTitleColor(disabledColor, forState: UIControlState.Disabled)
            baseButton.titleLabel?.textAlignment = NSTextAlignment.Center
            baseButton.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
            baseButton.titleLabel?.font = normalFont
            return baseButton
        }
        
        let custLabel   = {(lblName : String, view : UIView ) -> UILabel in
            let lbl = UILabel()
            lbl.setTranslatesAutoresizingMaskIntoConstraints(false)
            lbl.font = UIFont(name: "Verdana", size: 12.0)
            view.addSubview(lbl)
            lbl.text = lblName
            lbl.lineBreakMode = NSLineBreakMode.ByTruncatingTail
            return lbl
        }
        
        let custTextField   = {[weak weakSelf = self](txtValue : String, view : UIView ) -> UITextField in
            let txt = UITextField()
            txt.setTranslatesAutoresizingMaskIntoConstraints(false)
            view.addSubview(txt)
            txt.placeholder = txtValue
            txt.borderStyle = UITextBorderStyle.RoundedRect
            txt.userInteractionEnabled = true
            txt.delegate = weakSelf
            return txt
        }
        
        let custImageView   = {( image : String, view : UIView) -> UIImageView in
            let iv = UIImageView()
            iv.image = UIImage(named: image)
            iv.setTranslatesAutoresizingMaskIntoConstraints(false)
            view.addSubview(iv)
            return iv
        }

        self.view.backgroundColor = UIColor.blueColor()
        self.scrollView = UIScrollView(frame: CGRectZero)
        self.scrollView!.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.scrollView!.backgroundColor = UIColor.yellowColor()
        self.scrollView!.userInteractionEnabled = true
        self.view.addSubview(scrollView!)
  
     
        self.contentView = UIView(frame: CGRectZero)
        self.contentView!.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentView!.backgroundColor = UIColor.lightGrayColor()
        self.scrollView!.addSubview(self.contentView!)
        
        
        self.firstNameLbl = custLabel("First Name" , self.contentView!)
        self.firstNameTxt = custTextField("enter first name", self.contentView!)
        self.middleNameLbl = custLabel("Middle Name" , self.contentView!)
        self.middleNameTxt = custTextField("enter middle name", self.contentView!)
        self.lastNameLbl = custLabel("Last Name" , self.contentView!)
        self.lastNameTxt = custTextField("enter last name", self.contentView!)
        self.emailLbl = custLabel("Email" , self.contentView!)
        self.emailTxt = custTextField("enter email", self.contentView!)
        self.passwordLbl = custLabel("Password" , self.contentView!)
        self.passwordTxt = custTextField("enter password", self.contentView!)
        self.passwordConfirmationLbl = custLabel("Password Confirmation" , self.contentView!)
        self.passwordConfirmationLbl!.numberOfLines = 2
        self.passwordConfirmationTxt = custTextField("reenter password", self.contentView!)
        
        
        let viewsDict = ["scrollView" : scrollView!, "contentView" : contentView!,  "firstNameLbl" : firstNameLbl!, "firstNameTxt" : firstNameTxt!, "middleNameLbl" : middleNameLbl!, "middleNameTxt" : middleNameTxt!, "lastNameLbl" : lastNameLbl!, "lastNameTxt" : lastNameTxt!, "emailLbl" : emailLbl!, "emailTxt" : emailTxt!, "passwordLbl" : passwordLbl!, "passwordTxt" : passwordTxt!, "passwordConfirmationLbl" : passwordConfirmationLbl!, "passwordConfirmationTxt" : passwordConfirmationTxt! ]
        let metricsDict = ["lblWidth" : Int(90), "txtWidth" : 200, "height" : Int(30), "hSpace" : Int(5), "vSpace" : Int(40), "topOffset" : Int(20), "contentHeight" : Int(600)]
        
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: NSLayoutFormatOptions.allZeros, metrics: metricsDict, views: viewsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: NSLayoutFormatOptions.allZeros, metrics: metricsDict, views: viewsDict))
        
        
        self.scrollView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[contentView]|", options: NSLayoutFormatOptions.allZeros, metrics: metricsDict, views: viewsDict))
        self.scrollView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[contentView(==contentHeight)]|", options: NSLayoutFormatOptions.allZeros, metrics: metricsDict, views: viewsDict))
        
        self.view.addConstraint(NSLayoutConstraint(item: self.contentView! , attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.contentView! , attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
        
        self.contentView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[firstNameLbl(==lblWidth)]-(==hSpace)-[firstNameTxt]-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: metricsDict, views: viewsDict))
        self.contentView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[middleNameLbl(==lblWidth)]-(==hSpace)-[middleNameTxt]-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: metricsDict, views: viewsDict))
        self.contentView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[lastNameLbl(==lblWidth)]-(==hSpace)-[lastNameTxt]-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: metricsDict, views: viewsDict))
        self.contentView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[emailLbl(==lblWidth)]-(==hSpace)-[emailTxt]-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: metricsDict, views: viewsDict))
        self.contentView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[passwordLbl(==lblWidth)]-(==hSpace)-[passwordTxt]-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: metricsDict, views: viewsDict))
        self.contentView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[passwordConfirmationLbl(==lblWidth)]-(==hSpace)-[passwordConfirmationTxt]-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: metricsDict, views: viewsDict))
        self.contentView!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[firstNameLbl(==height)]-(==vSpace)-[middleNameLbl(==height)]-(==vSpace)-[lastNameLbl(==height)]-(==vSpace)-[emailLbl(==height)]-(==vSpace)-[passwordLbl(==height)]-(==vSpace)-[passwordConfirmationLbl(==height)]", options: NSLayoutFormatOptions.AlignAllLeading, metrics: metricsDict, views: viewsDict ))
        
            
            
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: nil)
        
       
        
        // Do any additional setup after loading the view.
    }

    
    
    override func viewDidDisappear(animated: Bool)
    {
         NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }

    
    
    func keyboardDidShow(notification : NSNotification)
    {
        if let info = notification.userInfo
        {
            if var kbRect = info[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue()
            {
                kbRect = self.view.convertRect(kbRect, fromView: nil)
                
                let contentInsets = UIEdgeInsetsMake(0, 0, kbRect.size.height, 0.0)
                self.scrollView!.contentInset = contentInsets
                self.scrollView!.scrollIndicatorInsets = contentInsets
                
                var  aRect = self.view.frame
                aRect.size.height -= kbRect.size.height
                
                if ( CGRectContainsPoint(aRect, self.activeField!.frame.origin) == false )
                {
                    self.scrollView!.scrollRectToVisible(self.activeField!.frame, animated: true)
                }
            }
        }
    }
    
    
    func keyboardWillBeHidden(notification : NSNotification)
    {
        let contentInsets = UIEdgeInsetsZero
        self.scrollView!.contentInset = contentInsets
        self.scrollView!.scrollIndicatorInsets = contentInsets
    }
    
   

}


extension ScrollViewController:   UITextFieldDelegate
{
    func textFieldDidBeginEditing(textField: UITextField)
    {
       self.activeField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        self.activeField = nil
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return false
    }
}

    
    
    















