//
//  Concentration.swift
//  Concentration_new
//
//  Created by HSH on 06/08/2019.
//  Copyright © 2019 Ajou University D2fault. All rights reserved.
//

import Foundation

struct Concentration{
    
    private(set) var cards = [Card]()
    
    private var IndexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        
        assert(cards.indices.contains(index), "Concentration.chooseCard(at \(index)): chosen index not in the cards")
        
        if !cards[index].isMatched{
            if let matchIndex = IndexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if card matched
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                IndexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        
        assert(numberOfPairsOfCards > 0,"Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
        //TODO: Suffle the Cards
        cards.shuffle()
        
    }
}
