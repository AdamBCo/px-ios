//
//  AddCouponViewModel.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 1/14/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import UIKit

class AddCouponViewModel: NSObject {

    var amount: Double!
    var coupon: DiscountCoupon?
    var email: String!

    let DISCOUNT_ERROR_AMOUNT_DOESNT_MATCH = "amount-doesnt-match"
    let DISCOUNT_ERROR_RUN_OUT_OF_USES = "run out of uses"
    let DISCOUNT_ERROR_CAMPAIGN_DOESNT_MATCH = "campaign-doesnt-match"
    let DISCOUNT_ERROR_CAMPAIGN_EXPIRED = "campaign-expired"

    init(amount: Double, email: String) {
        self.amount = amount
        self.email = email
    }

    func getCoupon(code: String, success: @escaping () -> Void, failure: @escaping ((_ errorMessage: String) -> Void)) {

        CustomServer.getCodeDiscount(discountCode: code, transactionAmount: self.amount, payerEmail: self.email, url: MercadoPagoCheckoutViewModel.servicePreference.getDiscountURL(), uri: MercadoPagoCheckoutViewModel.servicePreference.getDiscountURI(), discountAdditionalInfo: MercadoPagoCheckoutViewModel.servicePreference.discountAdditionalInfo, success: { [weak self] (coupon) in
            if let coupon = coupon {
                self?.coupon = coupon
                success()
            }}, failure: { (error) in
                if error.localizedDescription == self.DISCOUNT_ERROR_CAMPAIGN_DOESNT_MATCH {
                    failure(LocalizableStringsUtil.VENDEDOR_SIN_DESCUENTO)
                } else if error.localizedDescription == self.DISCOUNT_ERROR_RUN_OUT_OF_USES {
                    failure(LocalizableStringsUtil.SE_AGOTO_LA_CANTIDAD_DE_USOS)
                } else if error.localizedDescription == self.DISCOUNT_ERROR_AMOUNT_DOESNT_MATCH {
                    failure(LocalizableStringsUtil.IMPORTE_FUERA_DE_ALCANCE)
                } else if error.localizedDescription == self.DISCOUNT_ERROR_CAMPAIGN_EXPIRED {
                    failure(LocalizableStringsUtil.LA_CAMPAÑA_EXPIRO)
                } else {
                    failure(LocalizableStringsUtil.ALGO_SALIO_MAL)
                }
        })
    }
}
