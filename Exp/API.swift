//
//  API.swift
//  Exp
//
//  Created by Ernest Gaisie on 13/09/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import Foundation

private let _API_SharedInstance = API()

class API{
    static let currenciesReceivedNotification = Notification.Name("currenciesReceived")
    
    var C: [[String:String]] = [
        [
            "name" : "PerfectMoney USD",
            "shortName": "OUT OF STOCK",
            "buyingPrice": "1",
            "sellingPrice": "2"
        ],
        [
            "name" : "Bitcoin USD",
            "shortName" : "BTC",
            "buyingPrice" : "3",
            "sellingPrice" : "4",
            ],
        [
            "name" : "Skrill",
            "shortName" : "SK",
            "buyingPrice" : "5",
            "sellingPrice" : "6"
        ]
        
        
    ]
    
    class var sharedInstance: API
    {
        return _API_SharedInstance
    }
    
    func processCurrencies() {
        var currencies:[Currency] = [Currency]()
        
        for i in C{
            var currency = Currency()
            
            if let name: String = i["name"]{
                currency.name = name
            }
            if let shortName:String = i["shortName"]{
                currency.shortName = shortName
            }
            if let buyingPrice = i["buyingPrice"]{
                currency.buyingPrice = buyingPrice
            }
            if let sellingPrice = i["sellingPrice"]{
                currency.sellingPrice = sellingPrice
            }
            currencies += [currency]
        }
        
        if currencies.count > 0
        {
            NotificationCenter.default.post(name: API.currenciesReceivedNotification, object: currencies)
        }
    }
}
