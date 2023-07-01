//
//  Onboarding.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 02/12/1444 AH.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        NavigationView{
            if currentPage > totalPages{
                loginView()
            }else{
                WalkingthruoghScreen()
            }
        }
    }
}
    struct Onboarding_Previews: PreviewProvider {
        static var previews: some View {
            Onboarding()
        }
    }
    
//    struct Home: View{
//        var body: some View{
//            Text("Home Chef")
//                .font(.title)
//                .fontWeight(.heavy)
//        }
//    }
//
    
    struct  WalkingthruoghScreen: View{
        @AppStorage("currentPage") var currentPage = 1
        var body: some View{
            ZStack{
                if currentPage == 1 {
                    ScreenView(image: "img3", descreption: "enjoy with home chef ")
                        .transition(.scale)
                    .font(.caption)
                    
                }
                if currentPage == 2 {
                    ScreenView(image: "img4", descreption: "our goal is to faciliate the search for delicious dishes ")
                        .transition(.scale)
                        .padding(.leading, 8)
                        .font(.caption)
                }
                if currentPage == 3 {
                    ScreenView(image: "img5", descreption: "welcome to home chef app ")
                        .transition(.scale)
                        .padding(.trailing , 30 )
                        .font(.caption)
                        .fontWeight(.light)
                }
                
            }
            .overlay(
                Button(action: {
                    
                    withAnimation(.easeInOut){
                        if currentPage < totalPages{
                            currentPage += 1
                        }
                        else{
                            currentPage = 1
                        }
                    }
                }, label: {
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.white)
                        .frame(width: 60,height: 60)
                        .background(Color("Salmon"))
                        .clipShape(Circle())
                    
                        .overlay(
                            
                            ZStack{
                                Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                //.padding(-10)
                                
                                
                                Circle()
                                    .trim(from: 0 , to: 0.3)
                                    .stroke(Color(""), lineWidth: 4)
                                    .rotationEffect(.init(degrees: -90))
                                
                            }
                                .padding(-10)
                            
                            
                        )
                })
                .padding(.bottom,20)
                ,alignment: .bottom
                
                
            )
        }
    }
    
    struct ScreenView: View {
        
        var image: String
        var descreption: String
        @AppStorage("currentPage") var currentPage = 1
        var body: some View {
            VStack(spacing: 20){
                
                HStack{
                    if currentPage == 1{
                        Text("Home Chef")
                            .font(.title)
                            .fontWeight(.semibold)
                    }else{
                        Button(action: {withAnimation(.easeInOut){
                            currentPage -= 1
                        }}, label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .background(Color.black.opacity(0.4))
                                .cornerRadius(10)
                        })
                    }
                    
                    Spacer()
                        NavigationLink("skip", destination: loginView() )
                        
                    
                }
                .foregroundColor(.white)
                .padding()
                
                
                Spacer(minLength: 0)
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(descreption)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom,50)
                    .multilineTextAlignment(.center)
                
                
                Spacer(minLength:120)
            }
            .background(Image("background").blur(radius: 20))
        }
    }
    
    
    var totalPages = 3
