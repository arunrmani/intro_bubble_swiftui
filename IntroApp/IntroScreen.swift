    //
    //  IntroScreen.swift
    //  IntroApp
    //
    //  Created by Safe City Mac 001 on 25/09/2021.
    //

import SwiftUI

struct IntroScreen: View {
    var body: some View {
        ZStack {
            TabView {
                PageView()
                PageView()
                PageView()
                
            }
            .tabViewStyle(PageTabViewStyle())
            .ignoresSafeArea()
        }
    }
}

struct IntroScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreen()
    }
}

struct PageView: View{
    @State private var animate = false
    @State private var animateValueX :CGFloat = UIScreen.main.bounds.width
    @State private var animateValueY :CGFloat = UIScreen.main.bounds.height
    var body: some View{
        ZStack {
            ZStack(alignment: .leading){
                BlurCircle(color1: Color.blue1, color2: Color.blue2, width: animate ? animateValueX : UIScreen.main.bounds.width/1.2)
                    .offset(x: 0, y: 0)
                BlurCircle(color1: Color.yellow1, color2: Color.yellow2, width:150)
                    .offset(x: animate ? animateValueX : animateValueX-200, y: 150)
                BlurCircle(color1: Color.red, color2: Color.red, width:125)
                    .offset(x:animate ? -animateValueX : -70, y:  -animateValueY/2.3)
                    .opacity(0.5)
                BlurCircle(color1: Color.red, color2: Color.rose2, width:120)
                    .offset(x: animate ? animateValueX : animateValueX/1.7, y: -300)
                    .opacity(0.6)
            }
            RadialGradient(gradient: Gradient(colors: [.black]), center: .center, startRadius: 10, endRadius: 200)
                .opacity(0.3)
                .blur(radius: 8)
                .ignoresSafeArea()
            VStack {
                ZStack{
                    NormalSphere(color1: Color.orange, color2: Color.gold1, width: 80)
                        .offset(x: 75, y: animate ? -animateValueY : -100)
                    NormalSphere(color1: Color.red, color2: Color.rose2, width: 220)
                        .opacity(0.8)
                        .offset(x: -animateValueX/10, y: animate ? -300 : 10.0)
                    NormalSphere(color1: Color.blue1, color2: Color.blue2, width: 40)
                        .offset(x: animate ? -animateValueX/1.5 : -120, y: -100.0)
                    
                    NormalSphere(color1: Color.blue1, color2: Color.blue2, width: 40)
                        .offset(x: animate ? animateValueX/1.5 : 80, y: 100.0)
                    NormalSphere(color1: Color.blue1, color2: Color.blue2, width: 120)
                        .offset(x:animate ? -animateValueX/1.5 : -150, y: 100.0)
                    NormalSphere(color1: Color.orange, color2: Color.gold1, width: 25)
                        .offset(x:animate ? animateValueX/1.5 : 155, y: 100)
                    NormalSphere(color1: Color.gray, color2: Color.white, width: 20)
                        .offset(x: animate ? -animateValueX/1.5 :-150, y: 200)
                    NormalSphere(color1: Color.rose1, color2: Color.rose2, width: 50)
                        .offset(x: 300, y: animate ? animateValueY/1.5 : 10.0)
                    NormalSphere(color1: Color.yellow1, color2: Color.yellow, width: 20)
                        .offset(x: 0, y: animate ? -animateValueY/1.5 : 10.0)
                    
                }
                .offset(x: 0, y: 0)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .top)
                Spacer()
                Text("CONNECT")
                    .font(.system(size: 60))
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text("Archive your profile in a single click")
                    .font(.system(size: 20))
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.horizontal , 100)
                
                Spacer()
                ZStack{
                    NormalSphere(color1: Color.orange, color2: Color.gold1, width: 80)
                        .offset(x:animate ? animateValueX/1.5 : 120, y: 100.0)
                    NormalSphere(color1: Color.red, color2: Color.rose2, width: 150)
                        .opacity(0.8)
                        .offset(x: 0, y:animate ? animateValueX/1.5 : 10.0)
                    NormalSphere(color1: Color.blue1, color2: Color.blue2, width: 40)
                        .offset(x: animate ? animateValueX/1.5 : 75, y: -100)
                    NormalSphere(color1: Color.blue1, color2: Color.blue2, width: 40)
                        .offset(x:animate ? -animateValueX/1.5 : -120, y: -100.0)
                    NormalSphere(color1: Color.blue1, color2: Color.blue2, width: 40)
                        .offset(x: 80, y:animate ? animateValueX/1.5 : 100.0)
                    NormalSphere(color1: Color.blue1, color2: Color.blue2, width: 120)
                        .offset(x:animate ? -animateValueX/1.5 : -80, y: 100.0)
                }
                .offset(x: 0, y: 0)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .top)
            }
        }
        .onTapGesture {
            withAnimation(.spring()){
                animate.toggle()
            }
        }
        
    }
}

struct BlurCircle : View{
    var color1 : Color
    var color2 : Color
    var width : CGFloat
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [color2,color1]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .mask(Circle())
                .frame(width: width)
                .shadow(color: color1, radius: 40, x: -2, y: 1)
                .blur(radius: 15)
            RadialGradient(gradient: Gradient(colors: [Color.white]), center: .center, startRadius: 10, endRadius: 200)
                .mask(Circle())
                .frame(width: width/3)
                .offset(x: width/6, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .shadow(color: color2, radius: 30, x: -2, y: 1)
                .blur(radius: width*0.1)
            
        }
    }
}


struct NormalSphere : View{
    var color1 : Color
    var color2 : Color
    var width : CGFloat
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [color2,color1]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .mask(Circle())
                .frame(width: width)
                .shadow(color: .white, radius: 5, x: -2, y: 1)
                .blur(radius: 2)
            RadialGradient(gradient: Gradient(colors: [Color.white]), center: .center, startRadius: 10, endRadius: 200)
                .mask(Circle())
                .frame(width: width/3)
                .offset(x: width/6, y: 10
                )
                .blur(radius: width*0.12)
            
        }
    }
}


extension Color {
    static let blue1 = Color("blue-1")
    static let blue2 = Color("blue-2")
    
    static let gold1 = Color("gold-1")
    static let gold2 = Color("gold-2")
    
    static let rose1 = Color("rose-1")
    static let rose2 = Color("rose-2")
    
    static let yellow1 = Color("yellow-1")
    static let yellow2 = Color("yellow-2")
}
