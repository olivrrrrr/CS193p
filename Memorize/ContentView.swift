//
//  ContentView.swift
//  Memorize
//
//  Created by Oliver Ekwalla on 03/09/2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["😶‍🌫️", "🤥", "🥶", "🤠", "🥸", "👻", "🫡", "😈", "🤔", "🫣", "🫢" , "🎃" , "😹" , "💩" , "🫶🏿" , "🤮" , "👾", "🤖", "😽" , "🤘🏿" ]
    
    @State var emojiCount = 20
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                ForEach(emojis[0..<emojiCount],id: \.self , content :{ emoji in
                    CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                    })
                
            }
        }
           
            HStack{
                addButton
                Spacer() 
                subtractButton
           
            }
            .font(.largeTitle)
            .padding(.horizontal)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var addButton: some View {
        Button(action:{
            if emojiCount < emojis.count{
            emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.square")
        })
    }
    
    var subtractButton: some View{
        Button(action:{
            if emojiCount > 1{
            emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.square")
        })
    }
}

struct CardView : View{
    var content : String
    @State var isFaceUp : Bool = true
    var body : some View {
        // Z Stack stacks content towards the user
       
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp{
            RoundedRectangle(cornerRadius: 25.0)
                .fill()
                .foregroundColor(.red)
            
            RoundedRectangle(cornerRadius: 25.0)
                    .strokeBorder(lineWidth: 3)
            } else {
                Text(content)
                    .font(.largeTitle)
                
                RoundedRectangle(cornerRadius: 25.0)
                    .strokeBorder(lineWidth: 3)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
        ContentView()
            .preferredColorScheme(.light)
    }
}
