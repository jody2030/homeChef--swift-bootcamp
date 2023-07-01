//
//  chefViewModel.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import Foundation
import Combine
import FirebaseFirestore

class ChefsViewModel : ObservableObject {
   @Published var chefs = [Chef]()
    
    private var db = Firestore.firestore()
    private var listenerRegistration : ListenerRegistration?
    
    deinit {
    unsubscribe()
    }
    
    func unsubscribe () {
        if listenerRegistration != nil {
            listenerRegistration? .remove()
            listenerRegistration = nil
        }
    }
    
    func subscribe() {
        if listenerRegistration == nil {
            listenerRegistration = db.collection("Chef").addSnapshotListener { ( querySnapshot , error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.chefs = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot .data(as : Chef.self)
                    
                    
                }
            }
        }
    }
    
    func removeChefs (atOffsets indexSet : IndexSet) {
        let chefs = indexSet.lazy.map { self.chefs[$0]}
        chefs.forEach { chef in
            if let documentId = chef.id {
                db.collection("Chef").document(documentId).delete { error in
                    if let error = error {
                        print("Unable to remove document : \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
}
