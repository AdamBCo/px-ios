//
//  MPStepBuilder.swift
//  MercadoPagoSDK
//
//  Created by Demian Tejo on 1/7/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import Foundation
import UIKit

public class MPStepBuilder : NSObject {
    
    
    
    public class func startCustomerCardsStep(cards: [Card], callback: (selectedCard: Card?) -> Void) -> CustomerCardsViewController {
        return CustomerCardsViewController(cards: cards, callback: callback)
    }
    
    public class func startNewCardStep(paymentMethod: PaymentMethod, requireSecurityCode: Bool = true, callback: (cardToken: CardToken) -> Void) -> NewCardViewController {
        
        return NewCardViewController(paymentMethod: paymentMethod, requireSecurityCode: requireSecurityCode, callback: callback)
        
    }
    
    public class func startPaymentMethodsStep(supportedPaymentTypes: Set<PaymentTypeId>, callback:(paymentMethod: PaymentMethod) -> Void) -> PaymentMethodsViewController {
        
        return PaymentMethodsViewController(supportedPaymentTypes: supportedPaymentTypes, callback: callback)
    }
    
    public class func startIssuersStep(paymentMethod: PaymentMethod, callback: (issuer: Issuer) -> Void) -> IssuersViewController {
        return IssuersViewController(paymentMethod: paymentMethod, callback: callback)
    }
    
    public class func startInstallmentsStep(payerCosts: [PayerCost], amount: Double, callback: (payerCost: PayerCost?) -> Void) -> InstallmentsViewController {
        return InstallmentsViewController(payerCosts: payerCosts, amount: amount, callback: callback)
    }
    
    public class func startCongratsStep(payment: Payment, paymentMethod: PaymentMethod) -> CongratsViewController {
        return CongratsViewController(payment: payment, paymentMethod: paymentMethod)
    }
    
    public class func startInstructionsStep(payment: Payment, callback : (payment : Payment) -> Void) -> InstructionsViewController {
        return InstructionsViewController(payment: payment, callback : callback)
    }
    
    public class func startPromosStep() -> PromoViewController {
        return PromoViewController()
    }
    
    public class func startCreditCardForm(paymentSettings : PaymentSettings? , amount: Double,callback : ((paymentMethod: PaymentMethod, token: Token? ,  issuer: Issuer?, installment: Installment?) -> Void)) -> CardFormViewController {
        
        
        return CardFormViewController(paymentSettings : paymentSettings , amount: amount, callback : callback)
    }
    public class func startPayerCostForm(paymentMethod : PaymentMethod? , issuer:Issuer?, token : Token , amount: Double, minInstallments : Int,  callback : ((payerCost: PayerCost?) -> Void)) -> PayerCostViewController {
        
        
        return PayerCostViewController(paymentMethod: paymentMethod, issuer: issuer, token: token, amount: amount, minInstallments: minInstallments, callback: callback)
       // return PaymentInstallmentsViewController(paymentType : paymentType , callback : callback)
    }
    
    
}

