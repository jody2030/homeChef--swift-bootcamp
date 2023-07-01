//
//  Cart.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 28/11/1444 AH.
//

import SwiftUI

struct Cart : Identifiable {
    var id = UUID().uuidString
    var item : Item
    var quantity : Int
    
}
