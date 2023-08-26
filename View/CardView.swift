//
//  CardView.swift
//  DingDong Game
//
//  Created by Võ Phúc Duy Nhật on 25/08/2023.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var card:Card
    let width: Int
    
    @Binding var MatchedCards:[Card]
    @Binding var userChoices:[Card]
    
    var body: some View {
        if card.isFaceUp || MatchedCards.contains(where: {$0.id == card.id}){
            Text(card.text)
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color(red: 0.2, green: 0.7, blue: 0.8))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 0.18, green: 0.32, blue: 0.56), lineWidth: 5)
                )
        } else {
            Text("?")
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color(red: 0.2, green: 0.7, blue: 0.8))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 0.18, green: 0.32, blue: 0.56), lineWidth: 5)
                    )
                .onTapGesture {
                    if userChoices.count == 0{
                        card.turnOver()
                        userChoices.append(card)
                    } else if userChoices.count == 1{
                        card.turnOver()
                        userChoices.append(card)
                        withAnimation(Animation.linear.delay(1)){
                            for thisCard in userChoices {
                                thisCard.turnOver()
                            }
                        }
                        checkForMatch()
                    }
                }
        }
    }
    func checkForMatch(){
        if userChoices[0].text == userChoices[1].text{
            MatchedCards.append(userChoices[0])
            MatchedCards.append(userChoices[1])
        }
        userChoices.removeAll()
    }
}
