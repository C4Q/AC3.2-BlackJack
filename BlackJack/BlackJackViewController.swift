//
//  BlackJackViewController.swift
//  BlackJack
//
//  Created by Eric Chang on 11/7/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit


class BlackJackViewController: UIViewController {
  
  var deckID: String?
  var drawEndPoint: String?
  var player = 0
  var dealer: Int?
  var card: String?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getDeck(endPoint: "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=6")
    
    
  }
  
  func getDeck(endPoint: String) {
    APIRequestManager.manager.getData(endPoint: "\(endPoint)") { (data: Data?) in
      if  let validData = data,
        let validDeck = Deck.deck(from: validData) {
        let newDeck = validDeck
        self.deckID = newDeck.deckID
        self.drawEndPoint = "https://deckofcardsapi.com/api/deck/\(self.deckID!)/draw/?count=1"
        self.dealPlayer(endPoint: self.drawEndPoint!)
      }
    }
  }
  
  func dealPlayer(endPoint: String) {
    APIRequestManager.manager.getData(endPoint: "\(endPoint)") { (data: Data?) in
      if  let validData = data,
        let validCard = Card.cards(from: validData) {
        let dealtCard = validCard.value
        self.player += dealtCard
      }
    }
  }
  
  // MARK: - Navigation
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
  }
  
  
}
