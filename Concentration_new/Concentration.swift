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
    
    var IndexOfOneAndOnlyFaceUpCard: Int?{
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
    
    func chooseCard(at index: Int){
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
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
        //TODO: Suffle the Cards
        cards.shuffle()
        
    }
}
