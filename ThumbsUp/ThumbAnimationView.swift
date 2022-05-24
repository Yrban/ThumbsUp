//
//  ThumbAnimationView.swift
//  ThumbsUp
//
//  Created by Developer on 5/23/22.
//

import SwiftUI

struct ThumbAnimationView: View {
    
    @Binding var counter: Int
    
    @State var rotateUp = true
    @State var showConfettiAndBalloon = false
    
    let frameSize: CGFloat = 150
    
    var body: some View {
        ZStack {
            if showConfettiAndBalloon {
                BadgeView(count: counter)
                    .offset(x: -6, y: -25)
                    .floatify(duration: 1.5)
            }
            
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: showConfettiAndBalloon ? "hand.thumbsup.fill" : "hand.thumbsup")
                    .font(.title)
                    .rotationEffect(
                        .degrees(rotateUp ? 0 : 45),
                        anchor: .bottomLeading
                    )
                    .onTapGesture {
                        tapped()
                    }
                Text(counter > 0 ? counter.description : "")
            }
            .foregroundColor(showConfettiAndBalloon ? .yellow : .gray)
            ConfettiView(isAnimated: $showConfettiAndBalloon)
        }
        .frame(width: frameSize, height: frameSize)
        .clipShape(Circle())
    }
    
    private func tapped() {
        if !showConfettiAndBalloon {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                counter += 1
            }
            animate()
        }
    }
    
    private func animate() {
        withAnimation(.easeOut(duration: 0.25)) {
            rotateUp = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            showConfettiAndBalloon = true
            withAnimation(.spring(response: 0.1, dampingFraction: 0.1, blendDuration: 2)) {
                rotateUp = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.35) {
            showConfettiAndBalloon = false
        }
    }
}

struct ThumbAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbAnimationView(counter: .constant(3))
    }
}
