//
//  Order.swift
//  TakingBasicOrderDetails
//
//  Created by ramil on 12.11.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quanity = 3
    
    @Published var specialRequestsEnabled = false {
        didSet {
            if specialRequestsEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(quanity) * 2
        cost += Double(type) / 2
        
        if extraFrosting {
            cost += Double(quanity)
        }
        
        if addSprinkles {
            cost += Double(quanity) / 2
        }
        return cost
    }
    
}
