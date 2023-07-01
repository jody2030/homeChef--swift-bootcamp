//
//  SplashScreenView.swift
//  HomeChef
//
//  Created by Nojood Aljuaid  on 01/12/1444 AH.
//

import SwiftUI

//struct SplashScreenView: View {
//    @State private var isActive = false
//    @State private var size = 0.8
//    @State private var opacity = 0.5
//    var body: some View {
//
//        if isActive {
//            Home()
//        }
//        else {
//            ZStack{
//                Color("green")
//                    .ignoresSafeArea()
//                VStack{
//
//
//                    Image("img1")
//                        .resizable()
//                        .frame(width: 200 , height: 200)
//                        .foregroundColor(.red)
//
//
//
//                }
//
//                .scaleEffect(size)
//                .opacity(opacity)
//                .onAppear{
//                    withAnimation(.easeIn(duration: 1.0)){
//                        self.size = 0.9
//                        self.opacity = 1.0
//
//                    }
//                }
//
//            }
//            .onAppear{
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                    self.isActive = true
//                }
//            }        }
//
//    }
//}
//
//struct SplashScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        SplashScreenView()
//    }
//}
//
//
