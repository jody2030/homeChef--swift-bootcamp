//
//  loginView.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import SwiftUI


            
            struct loginView: View {
                var body: some View {
                    NavigationView{
                        ZStack{
                            Color.white
                                .ignoresSafeArea()
                            
                            GeometryReader{ proxy in
                                // let size = proxy.size
                                Image("background")
                                    .resizable()
                                    .ignoresSafeArea()
                                    .frame(width: 500, height: 800)
                                    .blur(radius: 20)
                            }
                            
                            VStack{
                                GlassMorphsim()
                            }
                            VStack(spacing:20){
                                NavigationLink("Login As a chef", destination: ChefLogin())
                                .foregroundColor(.white)
                                .frame(width: 200, height: 40)
                                .background(
                                    .linearGradient(colors: [Color.pink.opacity(0.3), Color("Orange")], startPoint: .leading, endPoint: .trailing) , in: RoundedRectangle(cornerRadius: 20))
                                
                                
                                NavigationLink("Login as a Costumer", destination: CustomerLogin()
                                    .navigationBarBackButtonHidden(true))
                                .foregroundColor(.white)
                                .frame(width: 200, height: 40)
                                .background(
                                    .linearGradient(colors: [Color.pink.opacity(0.3), Color("Orange")], startPoint: .leading, endPoint: .trailing) , in: RoundedRectangle(cornerRadius: 20))
                                
                        
                               
                            }
                            .padding(.top,150)
                            
                        }
                    }
                }
            }

            struct LoginView_Previews: PreviewProvider {
                static var previews: some View {
                    loginView()
                }
            }

            struct GlassMorphsim: View{
                var body: some View{
                    
                    let width = UIScreen.main.bounds.width
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .opacity(0.3)
                            .background{
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(
                                    
                                        .linearGradient(.init(colors: [Color("Salmon").opacity(0.5), Color("Orange"), .clear, .clear, Color("Orange")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    
                                    )
                                    .shadow(color: .blue.opacity(0.1), radius: 5)
                                VStack{
                                    Image("img")
                                        .resizable()
                                        .frame(width: 150 , height: 150 )
                                    Text("Welcome to HomeChef")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                   // Image(systemName: "frying.pan.fill")
                                    
                                        .padding(.bottom,200)
                                    
                                }
                                
                            
                            }
                    }
                    .frame(width: width / 1.1 , height: 650)
                }
            }
