//
//  MercadoPagoUIViewController.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 3/2/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

public class MercadoPagoUIViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation bar colors
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = UIColor().blueMercadoPago()
        
        //Custom back button with shopping cart
        var shoppingCartImage = MercadoPago.getImage("regular_payment")
        shoppingCartImage = shoppingCartImage!.imageWithRenderingMode(.AlwaysTemplate)
        let backButton = UIBarButtonItem()
        backButton.image = shoppingCartImage
        backButton.title = ""
        backButton.target = self
        backButton.tintColor = UIColor.whiteColor()
        self.navigationItem.backBarButtonItem = backButton
    }
    
    internal func clearMercadoPagoStyle(){
        //Navigation bar colors
        self.navigationController!.navigationBar.titleTextAttributes = nil
        self.navigationController?.navigationBar.barTintColor = UIColor().blueMercadoPago()
        
        self.navigationController?.navigationBar.barTintColor = nil
        
        //Custom back button with shopping cart
        self.navigationItem.backBarButtonItem = nil
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
