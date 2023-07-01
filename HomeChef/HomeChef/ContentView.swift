//
//  ContentView.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 27/11/1444 AH.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        

        
        
        
        NavigationView{
        ChefView()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
