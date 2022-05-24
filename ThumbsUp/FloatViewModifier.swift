//
//  FloatViewModifier.swift
//  ThumbsUp
//
//  Created by Developer on 5/24/22.
//

import SwiftUI

struct FloatViewModifier: ViewModifier {
    @State var time = 0.0
    let duration: TimeInterval
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .modifier(FloatGeometryEffect(time: time))
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
}

extension View {
    func floatify(duration: TimeInterval) -> some View {
        self.modifier(FloatViewModifier(duration: duration))
    }
}

struct FloatGeometryEffect: GeometryEffect {
    var time: Double
    var speed: Double = 70
    var xDirection = Double.random(in:  -0.1 ... 0.1)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * xDirection
        let yTranslation = speed * -time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}
