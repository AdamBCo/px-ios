//
//  MPLabel.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 3/28/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

public class MPLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    static let defaultColorText = UIColor(netHex:0x333333)
    static let highlightedColorText = UIColor(netHex:0x999999)
    static let errorColorText = UIColor(netHex:0xFF0000)
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        if(self.font != nil) {
            self.font = UIFont(name: MercadoPago.DEFAULT_FONT_NAME, size: (self.font?.pointSize)!)
            
        }
     }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        if(self.font != nil) {
            self.font = UIFont(name:MercadoPago.DEFAULT_FONT_NAME, size: (self.font?.pointSize)!)
            
        }
    }
    
    func addCharactersSpacing(spacing:CGFloat) {
        let attributedString = NSMutableAttributedString()
        if self.attributedText != nil {
            attributedString.appendAttributedString(self.attributedText!)
        }
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSMakeRange(0, self.attributedText!.length))
        self.attributedText = attributedString
    }
 
    
}
