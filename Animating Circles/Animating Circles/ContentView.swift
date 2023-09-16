//
//  ContentView.swift
//  Animating Circles
//
//  Created by Jaden Nation on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @State var scaleUpDown = false
    @State var rotateInOut = false
    @State var moveInOut = false
    
    var DiagonalCircles: some View {
        ZStack {
            Circle().fill(LinearGradient(gradient:                       Gradient(colors: [.green, .white]),                       startPoint: .top, endPoint: .bottom))
                .frame(width: 120, height: 120, alignment: .center)
                .offset(y: moveInOut ? -60 : 0)
            Circle().fill(LinearGradient(gradient:                       Gradient(colors: [.green, .white]),                       startPoint: .bottom, endPoint: .top))
                .frame(width: 120, height: 120,                           alignment: .center)
                .offset(y: moveInOut ? 60 : 0)
        }
        .opacity(0.5)
        .rotationEffect(.degrees(180))
    }
    
    var VerticalCircles: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                .frame(width: 120, height: 120, alignment: .center)
                .offset(y: moveInOut ? -60 : 0)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                .frame(width: 120, height: 120, alignment: .center)
                .offset(y: moveInOut ? 60 : 0)
        }
        .opacity(0.5)
        .rotationEffect(.degrees(60))
    }
    
    var HorizontalCircles: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                .frame(width: 120, height: 120, alignment: .center)
                .offset(x: moveInOut ? -60 : 0)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                .frame(width: 120, height: 120, alignment: .center)
                .offset(x: moveInOut ? 60 : 0)
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                HorizontalCircles
                VerticalCircles
                DiagonalCircles
            }
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleUpDown ? 1 : 0.25)
            .animation(.easeInOut.repeatForever().speed(1/8), value: scaleUpDown)
            .onAppear() {
                rotateInOut.toggle()
                scaleUpDown.toggle()
                moveInOut.toggle()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
