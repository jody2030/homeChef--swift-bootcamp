//
//  ChefDetailsView.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChefDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditChefSheet = false
    var chef : Chef
    
    private func editButton (action : @escaping () -> Void) -> some View {
        Button(action: { action () }) {
            Text("Edit")
        }
    }
    
    var body: some View {
        Form {
            Section(header : Text("item name")) {
                Text(chef.item_name)
                Text("\(chef.item_cost) RS")
            }
            
            Section(header : Text("details")) {
                Text(chef.item_details)
            }
            Section(header: Text("photo")){
                AnimatedImage(url : URL(string: chef.item_image))
                    .resizable()
                    .frame(width: 300 , height: 300)
            }
        }
        
        .navigationTitle(chef.item_name)
        .navigationBarItems(trailing: editButton {
            self.presentEditChefSheet.toggle()
        })
        .onAppear(){
            print("ChefDetailsView.onAppear() for \(self.chef.item_name)")
        }
        .onDisappear(){
            print("ChefDetailsView.onDisappear()")
        }
        .sheet(isPresented: self.$presentEditChefSheet){
            ChefEditView(viewModel: ChefViewModel(chef: chef) , mode: .edit)
          //  { result in
            //    if case .success(let action) =  result , action == .delete {
             //       self.presentationMode.wrappedValue.dismiss()
                }
            }
            
        }
  //  }
//}

struct ChefDetailsView_Previews: PreviewProvider {
    static var previews: some View {
let chef = Chef(item_cost: "15", item_details: "descripotion" , item_image: "photo", item_name: "item")
        
        return
        NavigationView{
            ChefDetailsView(chef: chef)
        }
    }
}
