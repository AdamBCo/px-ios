//
//  CongratsHeaderViewCell.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 16/2/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

class InstructionsHeaderViewCell: UITableViewCell {


    @IBOutlet weak var instructionsHeaderIcon: UIImageView!
    
    @IBOutlet weak var instructionsHeaderTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let tintedImage = instructionsHeaderIcon.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        self.instructionsHeaderIcon.image = tintedImage
        self.instructionsHeaderIcon.tintColor = UIColor().UIColorFromRGB(0xEFC701)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
