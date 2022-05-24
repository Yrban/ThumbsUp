//
//  ParticlesViewModifier.swift
//  Hopscotch15Puzzle
//
//  Created by Developer on 2/17/22.
//

import SwiftUI

struct ConfettiViewModifier: ViewModifier {
    @State var time = 0.0
    @State var scale = 0.1
    let duration: TimeInterval
    let amount: Int
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<amount, id: \.self) { index in
                content
                    .hueRotation(Angle(degrees: time * Double(amount)))
                    .scaleEffect(scale)
                    .modifier(ConfettiGeometryEffect(time: time))
                    .opacity(((duration - time) / duration))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation (.easeOut(duration: duration)) {
                    self.time = duration
                    self.scale = 1.0
                }
            }
        }
    }
}

extension View {
    func confettify(duration: TimeInterval, amount: Int) -> some View {
        self.modifier(ConfettiViewModifier(duration: duration, amount: amount))
    }
}

struct ConfettiGeometryEffect: GeometryEffect {
    var time: TimeInterval
    var speed = Double.random(in: 20...200)
    var direction = Double.random(in: -Double.pi...Double.pi)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let translationX = speed * cos(direction) * time
        let translationY = speed * sin(direction) * time
        let affineTranslation =  CGAffineTransform(translationX: translationX, y: translationY)
        return ProjectionTransform(affineTranslation)
    }
}
