//
//  FooterComponent.swift
//  TestAutolayout
//
//  Created by Demian Tejo on 10/19/17.
//  Copyright © 2017 Demian Tejo. All rights reserved.
//

import UIKit

class FooterComponent: NSObject {
  var props : FooterProps
    init(props: FooterProps) {
        self.props = props
    }

}
class FooterProps: NSObject {
    var buttonAction: FooterAction?
    var linkAction : FooterAction?
    
    init(buttonAction: FooterAction? = nil, linkAction: FooterAction? = nil) {
        self.buttonAction = buttonAction
        self.linkAction = linkAction
    }
}

class FooterAction : NSObject {
    var label : String
    var action : (() -> Void)
    init(label : String, action:  @escaping (() -> Void)) {
        self.label = label
        self.action = action
    }
}
