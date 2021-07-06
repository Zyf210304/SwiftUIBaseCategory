//
//  YFDribbleAnimatedView.swift
//  SwiftUIBaseCategory
//
//  Created by 张亚飞 on 2021/7/6.
//

import SwiftUI

struct YFDribbleAnimatedView: View {
    
    @State var rotateBall = false
    @State var showPopUp = false
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        VStack {
            
            Toggle(isOn: $rotateBall) {
                
                Text("Rotate Ball")
            }
            .padding()
            .padding(.horizontal, 10)
            
            Button {
                
                withAnimation(.spring()) {
                    showPopUp.toggle()
                }
            } label: {
                
                Text("Show PopUp")
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(scheme == .dark ? Color.black : Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.primary.opacity(0.1), radius: 5, x: -5, y: -5)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
        
            ZStack {
            
                if showPopUp {
                    
                    Color.primary.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation(.spring()) {
                                showPopUp.toggle()
                            }
                        }
                    
                    DribbleAnimatedView(showPopUp: $showPopUp, rotateBall: $rotateBall)
                }
            
            }
        )
    }
    
}

struct YFDribbleAnimatedView_Previews: PreviewProvider {
    static var previews: some View {
        YFDribbleAnimatedView()
    }
}



//Dribble Loader
struct DribbleAnimatedView: View {
    
    @Environment(\.colorScheme) var scheme
    
    
    @Binding var showPopUp: Bool
    @Binding var rotateBall: Bool
    
    @State var animateBall = false
    @State var animateRotation = false
    
    var body: some View {
        
        ZStack {
            
            (scheme == .dark ? Color.black : Color.white)
                .frame(width: 150, height: 150)
                .cornerRadius(14)
                .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: Color.primary.opacity(0.1), radius: 5, x: -5, y: -5)
            
            //ball shadow
            Circle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: animateBall ?  40 : 20, height: 40)
                .rotation3DEffect(
                    .init(degrees: 70),
                    axis: (x: 1, y: 0, z: 0),
                    anchor: .center
                )
                .offset(y: 35)
                .opacity(animateBall ? 1 : 0)
            Image("dirbble")
                .resizable()
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .rotationEffect(.init(degrees: rotateBall && animateRotation ? 360 : 0))
                .offset(y: animateBall ? 10 : -25)
        }
        .onAppear {
            doAnimation()
        }
    }
    
    func doAnimation(){
        
        withAnimation(Animation.easeInOut(duration:0.6).repeatForever(autoreverses: true)) {
            
            animateBall.toggle()
        }
        
        withAnimation(Animation.easeInOut(duration:0.8).repeatForever(autoreverses: true)) {
            
            animateRotation.toggle()
        }
        
    }
}
