//
//  ChefLogin.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct ChefLogin: View {
    @State var emaill = ""
    @State var password = ""
    var body: some View {
        NavigationView{
            
            VStack{
                
                
                Color.clear.background(.regularMaterial)
                VStack(alignment: .center, spacing: 16){
                    Image("img")
                        .resizable()
                        .frame(width: 200 , height: 200 , alignment: .center)
                        .padding()
                    
                    Text("Login ")
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                    TextField("Email", text: $emaill)
                        .border(.white)
                    SecureField("Password", text: $password)
                        .border(.white)
                    
                    
                    NavigationLink("Go", destination: ChefView()
                        .navigationBarBackButtonHidden(true))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            .linearGradient(colors: [Color.pink.opacity(0.3), Color("Orange")], startPoint: .leading, endPoint: .trailing) , in: RoundedRectangle(cornerRadius: 20))
                }
                
                
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y:30)
                .padding(.bottom,400)
                .background(
                    Image("background"))
                .blur(radius: 0)
                
            }.padding(.top,200)
            
        }
    }
}


struct ChefLogin_Previews: PreviewProvider {
    static var previews: some View {
        ChefLogin()
    }
}

