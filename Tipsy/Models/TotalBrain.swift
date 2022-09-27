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
        let total = String(format: "%.2f", total?.total ?? 56.32)
        return total
    }
    
    func getNumberOfPeople() -> String {
        return total?.numberOfPeople ?? "2"
    }
    
    func getTipPercentage() -> String {
        return total?.tipPercentage ?? "10"
    }
    
    mutating func calculateTip(bill: Float, pct: Float, splitNumber: Float) {
        let total = String(bill * pct / splitNumber)
        let people = String(splitNumber)
        let pct = String(pct * 100 - 100)
        
        self.total = Total(total: total, numberOfPeople: people, tipPercentage: pct)
    }
}
