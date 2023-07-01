//
//  ChefView.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ChefView: View {
    @StateObject var viewModel = ChefsViewModel()
    @State var presentAddChefSheet = false
    
    private var addButton: some View {
        Button(action: {
            self.presentAddChefSheet.toggle() })
        {
            Image(systemName: "plus")
        }
    }
    
   private func chefRowView (chef : Chef) -> some View {
        NavigationLink(destination: ChefDetailsView(chef: chef)) {
            VStack(alignment: .leading) {
                VStack{
                    AnimatedImage(url : URL(string: chef.item_image))
                        .resizable()
                        .frame(width: 300   , height: 200)
                        .clipShape(Rectangle())
                    
                    VStack(alignment: .leading) {
                        Text(chef.item_name)
                            .fontWeight(.bold)
                            
                        Text(chef.item_details)
                            .foregroundColor(.gray)
                        
                    }
                }
            }
        }
        
    }
    var body: some View {
        NavigationView{
            List{
                ForEach (viewModel.chefs) { chef in
                    chefRowView(chef: chef )
                    
                }
            }
            .navigationTitle("categories")
            .navigationBarItems(trailing: addButton)
            
            .onAppear() {
                print("ChefListView appears. Subscribing to data updates.")
                self.viewModel.subscribe()
            }
            .sheet(isPresented:  self.$presentAddChefSheet) {
                ChefEditView()
            }
        }
    }
}

struct ChefView_Previews: PreviewProvider {
    static var previews: some View {
        ChefView()
    }
}
