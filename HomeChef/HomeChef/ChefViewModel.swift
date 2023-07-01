//
//  ChefViewModel.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import Foundation
import Combine
import FirebaseFirestore

class ChefViewModel : ObservableObject {
    @Published var chef : Chef
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(chef : Chef = Chef(item_cost: "", item_details: "", item_image: "", item_name: "")) {
        self.chef = chef
        
        self.$chef
            .dropFirst()
            .sink { [weak self] chef in
                self? .modified = true
                
            }
            .store(in: &self.cancellables)
    }
    
    private var db = Firestore.firestore()
    
    private func addCategory (_ chef : Chef) {
        do {
            let _ = try db.collection("Chef").addDocument(from : chef)
        }
        catch {
            print(error)
        }
    }
    
    
    private func updateChef (_ chef : Chef) {
        if let documentId = chef.id {
            
            do {
            try  db.collection("Chef").document(documentId).setData (from : chef)
        }
        catch {
            print(error)
            
        }
    }
}
    private func updateOrAddChef() {
        if let _ = chef.id {
            self.updateChef (self.chef)
        }
        else {
            
            
            addCategory(chef)
        }
    }
        
        private func removeChef() {
            if let documentId = chef.id {
                db.collection("Chef").document(documentId).delete { error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    
                }
            }
        }
        
        
        

    func handleDoneTapped() {
        self.updateOrAddChef()
    }
    
    func handleDeleteTapped() {
        self.removeChef ()
    }
}

