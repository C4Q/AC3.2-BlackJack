//
//  Card.swift
//  BlackJack
//
//  Created by Eric Chang on 11/7/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import Foundation

enum CardParseError: Error {
    case response, image, value
}

enum CardValue: String {
    case Ace = "ACE"
    case Two = "2"
    case Three = "3"
    case Four = "4"
    case Five = "5"
    case Six = "6"
    case Seven = "7"
    case Eight = "8"
    case Nine = "9"
    case Ten = "10"
    case Jack = "JACK"
    case Queen = "QUEEN"
    case King = "KING"
    
    var intVal: Int {
        get {
            switch self {
            case .Ace:
                return 1
            case .Two:
                return 2
            case .Three:
                return 3
            case .Four:
                return 4
            case .Five:
                return 5
            case .Six:
                return 6
            case .Seven:
                return 7
            case .Eight:
                return 8
            case .Nine:
                return 9
            case .Ten:
                return 10
            case .Jack:
                return 10
            case .Queen:
                return 10
            case .King:
                return 10
            }
        }
    }
}

class Card {
    internal let image: String
    internal let value: Int
    
    init(image: String, value: Int) {
        self.image = image
        self.value = value
    }
    
    static func cards(from data: Data) -> Card? {
        
        do {
            let jsonData: Any = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let response = jsonData as? [String: Any]
                else {
                    print("response json error")
                    throw CardParseError.response
            }
            
            guard let cards = response["cards"] as? [[String: Any]],
                cards.count > 0,
                let imageURL = cards[0]["image"] as? String,
                let cardValue = cards[0]["value"] as? String
                else {
                    print("test")
                    throw CardParseError.value }
            
            let convertCard = CardValue(rawValue: cardValue)
            let intCard = convertCard?.intVal
            
            
            let validCard = Card(image: imageURL, value: intCard!)
            return validCard
        }
            
        catch {
            print("error: \(error)")
        }
        return nil
    }
    
}
