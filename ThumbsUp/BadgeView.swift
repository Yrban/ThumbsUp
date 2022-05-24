//
//  BadgeView.swift
//  ThumbsUp
//
//  Created by Developer on 5/23/22.
//

import SwiftUI

struct BadgeView: View {
    
    let count: Int
    
    var body: some View {
        Text(count.description)
            .padding(4)
            .foregroundColor(.white)
            .font(.title3)
            .background(
            Image(systemName: "drop.fill")
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .foregroundColor(.blue)
                .rotationEffect(.degrees(180))
                .offset(x: 0, y: 3)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(count: 2)
    }
}
