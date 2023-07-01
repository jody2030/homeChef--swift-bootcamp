//
//  CreateAccount_Chef.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct CreateAccount_Chef: View {
    @State var userName = ""
    @State var emaill = ""
    @State var password = ""
    @State var confirmpassword = ""
    var body: some View {
        NavigationView{
            VStack{
                
                Color.clear.background(.regularMaterial)
                VStack(alignment: .center, spacing: 16){
                    Text("Create Account")
                        .font(.largeTitle).bold()
                    TextField("User Name", text: $userName)
                        .border(.white)
                    TextField("Email", text: $emaill)
                        .border(.white)
                    SecureField("Password", text: $password)
                        .border(.white)
                    SecureField("Confirm Password", text: $confirmpassword)
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
                        
                    }
                }
            }
        }
    
struct CreateAccount_Chef_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount_Chef()
    }
}
