//
//  TipBrain.swift
//  Tipsy
//
//  Created by sjp on 2022/09/28.
//

import UIKit

struct TotalBrain {
    
    var total: Total?
    func getTotal() -> String {
        return total?.total ?? "56.32"
    }
    
    func getNumberOfPeople() -> String {
        return total?.numberOfPeople ?? "2"
    }
    
    func getTipPercentage() -> String {
        return total?.tipPercentage ?? "10"
    }
    
    mutating func calculateTip(bill: Float, pct: Float, splitNumber: Float) {
        let total = String(format:"%.2f",(bill + (bill * pct / 100)) / splitNumber)
        let people = String(format:"%.0f", splitNumber)
        let pct = String(format:"%.0f", pct)
        
        self.total = Total(total: total, numberOfPeople: people, tipPercentage: pct)
    }
}
