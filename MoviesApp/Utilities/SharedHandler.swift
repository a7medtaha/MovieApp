//
//  SharedHandler.swift
//  wuzfone
//
//  Created by Donna on 10/6/18.
//  Copyright © 2018 Madonna. All rights reserved.
//



import Foundation
import UIKit

class SharedHandler{
    
    
    static func alertDialogawithSegue(_ sourceViewController: UIViewController,_ destinationViewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: { (action) in
            
            sourceViewController.present(destinationViewController, animated: true, completion: nil)
        }))
        
        // show the alert
        sourceViewController.present(alert, animated: true, completion: nil)
        
    }
    
    static func alertDialogawithPopNavigationVC(_ sourceViewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: { (action) in
            
            sourceViewController.navigationController?.popViewController(animated: true)
        }))
        
        // show the alert
        sourceViewController.present(alert, animated: true, completion: nil)
        
    }
    
    
    static func DissapearMessage(viewController: UIViewController,message: String,myHandler: (() -> Swift.Void)? = nil)
    {
        let alert = UIAlertController(title: "", message: message , preferredStyle: UIAlertController.Style.alert)
        
        viewController.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    static func startSpinner (_ Spinner: UIActivityIndicatorView, _ View: UIView){
        Spinner.startAnimating()
        Spinner.isHidden = false
        View.isHidden = true
        
    }
    static func stopSpinner (_ Spinner: UIActivityIndicatorView,_ View: UIView){
        Spinner.stopAnimating()
        Spinner.isHidden = true
        View.isHidden = false
        
    }
    static func alertDialog(_ viewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    static func alertDialogWithDismiss(_ viewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button) UIAlertAction(title: BtnTitle, style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: { (uialertaction) in
            print("inside alert closure")
            viewController.dismiss(animated: true, completion: nil)
        }))
        
        // show the alert
        viewController.present(alert, animated: true, completion: nil)
        
    }
    static func alertDialogWithPOpRootNavigation(_ viewController: UIViewController,_ title: String , _ message: String ,BtnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button) UIAlertAction(title: BtnTitle, style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(UIAlertAction(title: BtnTitle, style: UIAlertAction.Style.default, handler: { (uialertaction) in
            print("inside alert closure")
            viewController.dismiss(animated: true, completion: nil)
        }))
        
        // show the alert
        viewController.navigationController?.popToRootViewController(animated: true)
        
    }
    
    static func createLabelNoResult(_ viewController : UIViewController){
        // CGRectMake has been deprecated - and should be let, not var
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: viewController.view.frame.width , height: 60 ))
        
        // you will probably want to set the font (remember to use Dynamic Type!)
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        
        // and set the text color too - remember good contrast
        label.textColor = .black
        
        // may not be necessary (e.g., if the width & height match the superview)
        // if you do need to center, CGPointMake has been deprecated, so use this
        label.center = CGPoint(x: viewController.view.frame.width / 2.0, y: viewController.view.frame.height / 2.0)
        
        // this changed in Swift 3 (much better, no?)
        label.textAlignment = .center
        label.font = label.font.withSize(18)
        label.text = "No Data."
        
        
        viewController.view.addSubview(label)
    }
    
    static func isValidAction(textFeilds: [UITextField]) -> Bool {
        
        for myTextFeild in textFeilds {
            if (myTextFeild.text!.isEmpty) {
                return false
            }
        }
        return true
    }
}
