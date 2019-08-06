//
//  Concentration.swift
//  Concentration_new
//
//  Created by HSH on 06/08/2019.
//  Copyright © 2019 Ajou University D2fault. All rights reserved.
//

import Foundation

class Concentration{
    var cards = [Card]()
    
    var IndexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = IndexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if card matched
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                IndexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                IndexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
        //TODO: Suffle the Cards
        
        
    }
}
