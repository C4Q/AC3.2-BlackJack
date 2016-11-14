//
//  BlackJackViewController.swift
//  BlackJack
//
//  Created by Eric Chang on 11/7/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit


class BlackJackViewController: UIViewController {
    @IBOutlet weak var playerCardTwo: UIImageView!
    @IBOutlet weak var playerCard: UIView!
    @IBOutlet weak var playerMoneyLabel: UILabel!
    @IBOutlet weak var playerBetLabel: UILabel!
  @IBOutlet weak var dealButton: UIButton!
  var deckID: String?
  var drawEndPoint: String?
  var player = 0
  var dealer = 0
  var card: String?
  var playing = false
  var playerMoney = 1000
  var playerBet = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getDeck(endPoint: "d")
    
    
  }
  
  func getDeck(endPoint: String) {
    APIRequestManager.manager.getData(endPoint: "\(endPoint)") { (data: Data?) in
      if  let validData = data,
        let validDeck = Deck.deck(from: validData) {
        let newDeck = validDeck
        self.deckID = newDeck.deckID
        self.drawEndPoint = "https://deckofcardsapi.com/api/deck/\(self.deckID!)/draw/?count=1"
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
    
    func checkIfPlaying() {
        while playing {
            dealPlayer(endPoint: self.drawEndPoint!)
            //dealDealer
            if player == 21 || dealer == 21 {
                playing = false
                //Label for game status will say "BLACKJACK!" and "YOU WIN!" or "YOU LOSE!"
            }
            //
            
        }
    }
    
    /*
     //PLACING BET: This is Bet button action function
     
     @IBAction func bet(_ sender: UIButton) {
     
     let num = sender.currentTitle
     
     playerBet += Int(num!)! //Player clicks on "chips" to increment their total bet by the chip value
     
     playerMoney -= Int(num!)! //Each bet takes away from playerMoney
     
     playerBetLabel.text? = String(playerBet) //This updates the label to show the Player how much $$ they've put at stake thus far
     }
     
    
    //DEAL
     
     @IBAction func deal(_ sender: UIButton) {
     
     playing = true
     checkIfPlaying() //deals player and dealer
     playerScoreLabel.text = String(player)
     //Update UIImages for Player and Dealer NOTE: Dealer has 1 card hidden
     
     }
     
     //HIT
     
     @IBAction func hit(_ sender: UIButton) {
     
     checkIfPlaying() //for a hit we dont deal the Dealer unless Player loses
     //Updates UIImage for player only 
     playerScoreLabel.text = String(player)
     guard player < 22 else {
        //Dealer gets dealt, hidden card revealed, dealer score updated, and player loses
        playing = false
     }
     //Update UIImage for hidden card for dealer
     dealerScoreLabel.text = String(dealer)
     }
     
     //STAND
     
     @IBAction func stand(_ sender: UIButton) {
     //Update UIImage for hidden card for dealer
     dealDealer
     dealerScoreLabel.text = dealer
     //compare scores
     
     playing = false
     }
     
     //DOUBLE
     
     @IBAction func double(_ sender: UIButton) {
        if playerMoney >= playerBet {
            playerBet *= 2
            //Player has to stand
        }
     }
     
     //SPLIT
     
     @IBAction func split(_ sender: UIButton) {
     //Player has to draw two cards of equal value
     //Double function is called and a new player hand is made with one of the hands being dealt
     }
     
     
     */

  
  // MARK: - Navigation
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
  }
  
  
}
