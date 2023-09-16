//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SwiftUI

struct BodyView: View {
    @State var squareSize: CGSize = CGSize(width: 50, height: 50)
    var body: some View {
        VStack {
            GeometryReader { outerGeo in
                Rectangle()
                    .frame(height: outerGeo.size.height / 2)
                    .foregroundColor(.gray)
                
                VStack {
                    Text("Trigger animation")
                        .foregroundStyle(Color.green)
                        .padding()
                        .background {
                            Color.black
                        }
                        .onTapGesture {
                            let sizeVal = squareSize.width > 50 ? 50 : 100
                            withAnimation(.interpolatingSpring(stiffness: 60, damping: 2)) {
                                self.squareSize = CGSize(width: sizeVal, height: sizeVal)
                            }
                            
                        }
                    GeometryReader { innerGeo in
                        VStack {
                            Text("Hello World")
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: squareSize.width, height: squareSize.height)
                                .background {
                                    Color.blue
                                }
                        }
                        .padding()
                        .background {
                            Color.yellow
                        }
                        
                    }
                    Spacer()
                    
                
                }
                .offset(y: outerGeo.frame(in: .local).size.height / 2)
            }
        }
        .frame(width: 400, height: 600)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(BodyView())
