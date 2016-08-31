//
//  CustomerPaymentMethodCell.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 9/8/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

class CustomerPaymentMethodCell: UITableViewCell {

    static let ROW_HEIGHT = CGFloat(52)
    
    @IBOutlet weak var paymentIcon: UIImageView!
    @IBOutlet weak var paymentMethodTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillRowWithCustomerPayment(card : Card){
        self.paymentIcon.image = MercadoPago.getImage(card.paymentMethod!._id)
        self.paymentMethodTitle.text = "terminada en ".localized + card.lastFourDigits!
    }

}
