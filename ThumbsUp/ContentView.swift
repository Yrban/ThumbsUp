//
//  ContentView.swift
//  ThumbsUp
//
//  Created by Developer on 5/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var counter = 0
    
    var body: some View {
        ThumbAnimationView(counter: $counter)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
