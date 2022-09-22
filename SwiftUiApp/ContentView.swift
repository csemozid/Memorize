//
//  ContentView.swift
//  SwiftUiApp
//
//  Created by Md. Abdul Mozid on 19/3/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"]
    @State var emojiCount = 10
    var body: some View {
        VStack{
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
                        ForEach (emojis[0..<emojiCount], id: \.self) {
                            emoji in CardView(thing: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            .padding(.vertical)
            .foregroundColor(.red)
            
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.all)
        }
        .padding(.horizontal)
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {Image(systemName: "minus.square")}
            .font(.largeTitle)
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {Image(systemName: "plus.app")}
            .font(.largeTitle)
    }
}



struct CardView: View {
    var thing: String
    @State var isFaceUp: Bool = true
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 2)
                Text(thing)
                    .font(.largeTitle)
            }
            else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
