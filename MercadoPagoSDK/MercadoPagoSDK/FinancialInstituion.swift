//
//  FinancialInstituion.swift
//  MercadoPagoSDK
//
//  Created by AUGUSTO COLLERONE ALFONSO on 3/9/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation

open class FinancialInstitution : NSObject, Cellable {
    open var _id : Int?
    open var _description : String?
    
    open func getCell(width: Double, height: Double) -> UITableViewCell {
        let bundle = MercadoPago.getBundle()
        let cell: FinancialInstitutionTableViewCell = bundle!.loadNibNamed("FinancialInstitutionTableViewCell", owner: nil, options: nil)?[0] as! FinancialInstitutionTableViewCell
        cell.fillCell(financialInstitution: self, bundle: bundle!)
        cell.addSeparatorLineToBottom(width: width, height: height)
        cell.selectionStyle = .none

        return cell
    }
    
    open class func fromJSON(_ json : NSDictionary) -> FinancialInstitution {
        let financialInstitution: FinancialInstitution = FinancialInstitution()
        
        if let _id = JSONHandler.attemptParseToString(json["id"])?.numberValue{
            financialInstitution._id = _id as Int?
        }
        if let description = JSONHandler.attemptParseToString(json["description"]){
            financialInstitution._description = description
        }
        
        return financialInstitution
    }
    
    open func toJSONString() -> String {
        return JSONHandler.jsonCoding(toJSON())
    }
    
    open func toJSON() -> [String:Any] {
        let id : Any = self._id == nil ? JSONHandler.null : self._id!
        let description : Any = self._description == nil ? JSONHandler.null : self._description!
        let obj:[String:Any] = [
            "id": id,
            "description" : description,
            ]
        return obj
    }
}

public func ==(obj1: FinancialInstitution, obj2: FinancialInstitution) -> Bool {
    
    let areEqual =
        obj1._id == obj2._id &&
            obj1.description == obj2.description
    
    return areEqual
}
