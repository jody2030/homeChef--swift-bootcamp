//
//  Item.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 28/11/1444 AH.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Item : Identifiable  {
    var id: String
    var item_name: String
    var item_cost: NSNumber
    var item_details: String
    var item_image: String
    var item_ratings: String
    var isAdded : Bool = false
}
