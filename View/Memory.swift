//
//  Memory.swift
//  DingDong Game
//
//  Created by Võ Phúc Duy Nhật on 25/08/2023.
//

import Foundation
import SwiftUI

class Card:Identifiable, ObservableObject {
    var id = UUID()
    @Published var isFaceUp = false
    @Published var isMatched = false
    var text:String
    
    init(text:String){
        self.text = text
    }
    
    func turnOver(){
        self.isFaceUp.toggle()
    }
}

let cardValues: [String] = [
    "🥘", "🥗", "🍖", "🥩", "🥙", "🍔", "🥐", "🍕", "🍿", "🍒", "🌮", "🍱"
]

func createCardList() -> [Card] {
    //Create a blank list
    var cardList = [Card]()
    
    for cardValue in cardValues {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    
    return cardList
}

let faceDownCard = Card(text: "?")
