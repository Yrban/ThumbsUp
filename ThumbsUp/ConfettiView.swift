//
//  ConfettiView.swift
//  ThumbsUp
//
//  Created by Developer on 5/23/22.
//

import SwiftUI

struct ConfettiView: View {
    
    let confettiSize: CGFloat = 4
    let duration: TimeInterval = 1
    let amount: Int = 50
    @Binding var isAnimated: Bool
    
    var body: some View {
        ZStack {
            if isAnimated {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: confettiSize, height: confettiSize)
                    .confettify(duration: duration, amount: amount)
                    .offset(x: -10, y: -10)
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: confettiSize, height: confettiSize)
                    .confettify(duration: duration, amount: amount)
                    .offset(x: 10, y: -10)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: confettiSize, height: confettiSize)
                    .confettify(duration: duration, amount: amount)
                    .offset(x: 0, y: -10)
            }
        }
    }
}

struct ConfettiViewIntermediary: View {
    
    @State var isAnimated = false
    let frameSize: CGFloat = 80
    
    var body: some View {
        VStack {
            Button {
                isAnimated = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isAnimated = false
                }
            } label: {
                Text("Animate")
            }
            ZStack {
                ConfettiView(isAnimated: $isAnimated)
            }
            .frame(width: frameSize, height: frameSize)
            .clipShape(Circle())
        }
    }
}

struct ConfettiView_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiViewIntermediary()
    }
}
