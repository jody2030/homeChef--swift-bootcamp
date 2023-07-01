//
//  chef_category.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import Foundation
import FirebaseFirestoreSwift


struct Chef : Identifiable , Codable {
    
    @DocumentID var id : String?
    
    var item_cost : String
    var item_details : String
    var  item_image : String
    var item_name : String
    
    
    enum Codingkeys : String , CodingKey {
        case id
        case item_cost = "cost"
        case item_details
        case item_image
        case item_name 
    }
    
}
