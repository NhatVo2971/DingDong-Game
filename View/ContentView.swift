//
//  ContentView.swift
//  DingDong Game
//
//  Created by Võ Phúc Duy Nhật on 25/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    private var sixColumnGrid = [GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible())]
    
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var userChoises = [Card]()
    
    var body: some View {
        GeometryReader{geo in
            VStack{
                Text("🌟 DingDong GAME 🌟")
                    .font(.largeTitle)
                
                LazyVGrid(columns: fourColumnGrid, spacing: 10){
                    ForEach(cards){card in
                        CardView(card: card,
                                 width: Int(geo.size.width/4 - 10),
                                 MatchedCards: $MatchedCards,
                                 userChoices: $userChoises)
                    }
                }
                    VStack{
                        Text("Match these cards to win:")
                        LazyVGrid(columns: sixColumnGrid, spacing: 5){
                            ForEach (cardValues, id:\.self){cardValue in
                                if !MatchedCards.contains(where: {$0.text == cardValue}){
                                    Text(cardValue)
                                        .font(.system(size: 40))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
