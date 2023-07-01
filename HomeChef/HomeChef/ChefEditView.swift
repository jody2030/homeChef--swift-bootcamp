//
//  ChefEditView.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import SwiftUI

enum Mode {
    case new
    case edit
}

enum Action {
    case delete
    case done
    case cancel
}

struct ChefEditView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
    @ObservedObject var viewModel = ChefViewModel()
    var mode : Mode = .new
   // var completionHandler : ((Result<Action , Error>) -> Void ) ?
    
    
    var cancelButton : some View {
        Button(action: {self.handleCancelTapped()} ) {
            Text("Cancel")
        }
    }
    
    var saveButton : some View {
        Button(action: {self.handleDoneTapped() }) {
            Text(mode == .new ? "Done" : "Save")
        }
        .disabled(!viewModel.modified)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header : Text("Category")){
                    TextField("Item Name" , text: $viewModel.chef.item_name)
                    TextField ("Item Cost" , text: $viewModel.chef.item_cost )
                }
                
                Section(header: Text("details")) {
                    TextField("Details" , text: $viewModel.chef.item_details)
                }
                
                Section(header : Text("Photo")) {
                    TextField("Image" , text: $viewModel.chef.item_image)
                }
                
                if mode == .edit {
                    Section {
                        Button("Delete item") {self.presentActionSheet.toggle() }
                            .foregroundColor(.red)
                    }
                }
            }
            
            .navigationTitle(mode == .new ? "New Category" : viewModel.chef.item_name)
            .navigationBarTitleDisplayMode(mode == .new ? .inline : .large)
            .navigationBarItems(leading: cancelButton ,
                                trailing: saveButton)
            .actionSheet(isPresented: $presentActionSheet) {
                ActionSheet(title: Text("Are you Sure?") ,
                buttons: [
                    .destructive(Text("Delete item"),
                                 action: {self.handleDeleteTapped() }),
                    .cancel()
                ])
            }
        }
    }

    
    func handleCancelTapped() {
        self.dismiss()
    }
    
    func handleDeleteTapped() {
        viewModel.handleDeleteTapped()
            self.dismiss()
      //  self.completionHandler?(.success(.delete))
    }

func handleDoneTapped() {
    self.viewModel.handleDoneTapped()
    self.dismiss()
}

func dismiss () {
    self.presentationMode.wrappedValue.dismiss()
}
    
}
struct ChefEditView_Previews: PreviewProvider {
    static var previews: some View {
        let chef = Chef(item_cost: "", item_details: "", item_image: "", item_name: "")
        let chefViewModel = ChefViewModel(chef: chef)
        return ChefEditView (viewModel: chefViewModel , mode: .edit)
    }
}
