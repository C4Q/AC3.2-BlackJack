# BlackJack

##Eric ♪~ ᕕ( ᐛ )ᕗ 

The Deck API:
```Javascript
{
deck_id: "ir061xpmqy46",
success: true,
remaining: 312,
shuffled: true
}
```
Drawing Cards:
```Javascript
{
"deck_id": "ad78q97ru8ab",
"success": true,
"remaining": 296,
"cards": [
          {"images": {"svg": "http://deckofcardsapi.com/static/img/JC.svg",
                      "png": "http://deckofcardsapi.com/static/img/JC.png"},
           "suit": "CLUBS",
           "image": "http://deckofcardsapi.com/static/img/JC.png", "code": "JC", "value": "JACK"}
          ]
}
```


So it only makes sense to have 2 models
-> Deck to grab the deckID
-> Draw cards off the same deck
 
 
Getting the value:
```Swift
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
                return 11
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
```


How to use?  ლ(ಥ Д ಥ )ლ

First, parse data as usual:
```Swift
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
```

Then, use the variable for what the card value is to "get" it:
```Swift
let convertCard = CardValue(rawValue: cardValue)
            let intCard = convertCard?.intVal
            
            let validCard = Card(image: imageURL, value: intCard!)
```

Now you try! Yayy!!~ ☆*:. o(≧▽≦)o .:*☆


//--------------------------------------------------------------------------------------------------------------------

##Martyav

I handled the view, almost entirely in storyboard. I also read up on how to create custom button classes, because the default styling on buttons is very flat and blocky. Rounded buttons with borders are very common in web design and signal to users that this is an area of the screen that can be clicked. Since XCode's GUI lacks controls for borders, I had to write a custom button class to give the buttons the styling I wanted.

Creating a custom class for buttons is not too difficult. First, hit command-N or click through the file submenus.

![Command-N or click through the file menu to make a new file](https://cloud.githubusercontent.com/assets/19174201/20250202/615afe0c-a9d9-11e6-9f07-8918f726a22a.png)

Pick Cocoa Touch Class for your new file.

![Select Cocoa Touch Class as your template](https://cloud.githubusercontent.com/assets/19174201/20250199/615ab2c6-a9d9-11e6-8669-765fffee6c0d.png)

When creating your file, make sure to subclass it from UIButton. Give it a good, descriptive name, so it's clear what it does. My name for mine isn't that great. It's only workable because it's the only custom button on the project.

![](https://cloud.githubusercontent.com/assets/19174201/20250198/615a574a-a9d9-11e6-9a99-33449f9e35c7.png)

You'll now have something that looks like this:

![](https://cloud.githubusercontent.com/assets/19174201/20250988/faf9d426-a9e2-11e6-8b80-c4636f01efe2.png)

This isn't that helpful. All it contains is a commented-out function that you're warned NOT to use. So what do we do now?

We have to set up our class with an init -- an init that sets the properties we want to style. UIButton already has a bunch of properties we can work with to style our button, so the main thing is to figure out what their names are and how to configure them properly.

I looked at some code from http://webindream.com/how-to-customise-button-in-swift/ but it wasn't quite right, because it was for an earlier version of Swift. In Swift 3, the init has to be marked required, and it also has to be failable, because it chains to a failable super init.

![](https://cloud.githubusercontent.com/assets/19174201/20250473/2874b30e-a9dd-11e6-8931-acda2ef0619f.png)

Add a question mark, and you're good to go.

![](https://cloud.githubusercontent.com/assets/19174201/20250484/42027464-a9dd-11e6-8ebc-add449004b6a.png)

Ok, but what about the corners?

As https://robots.thoughtbot.com/building-ios-interfaces-custom-button points out, views (much like ogres) have layers. And these layers have properties that can be manipulated. Thoughtbot demonstrates this by rounding the corners for a button with some code inside viewDidLoad(). It's generally nicer to put this kind of styling in its own file, especially if you're styling a bunch of buttons at once.

First, we round the corners of our button by setting the cleverly named self.layers.cornerRadius. If you know CSS, corner radius should feel pretty familiar. We set it to 5.0. Higher numbers mean rounder buttons. We just want it slightly round.  

![](https://cloud.githubusercontent.com/assets/19174201/20250630/b6cab184-a9de-11e6-90ad-f3d3c18ff2cf.png)

Then, we set a width for our button's borders, because we want nice, colored borders that aren't too wide or too narrow. This is done via the cleverly named property, borderWidth.

![](https://cloud.githubusercontent.com/assets/19174201/20250680/55675bd0-a9df-11e6-8c5b-aae3f6982a1e.png)

Here comes the slightly confusing part. We want to set a color, but if we try to do it just by casting to UIColor, we get this error:

![](https://cloud.githubusercontent.com/assets/19174201/20250741/06b4c896-a9e0-11e6-9422-3e873e6767fc.png)

We fix this by calling on cgColor at the end of our color definition. XCode is now happy again.

![](https://cloud.githubusercontent.com/assets/19174201/20250628/b6c98fd4-a9de-11e6-9748-acf667d4cab6.png)

The final code looks like this:

![](https://cloud.githubusercontent.com/assets/19174201/20250197/615708f6-a9d9-11e6-9f2c-1738210b5706.png)

And our buttons look like this:

![](https://cloud.githubusercontent.com/assets/19174201/20250779/6ab87202-a9e0-11e6-91e4-512e001e6ac9.png)

*Note that the "alpha" in our color code refers to the alpha channel, which is basically how transparent the color is. An alpha of 1.0 is a completely solid color, while an alpha of 0 is completely transparent. Messing with the alpha channel can allow you to do some fancy effects. It also lets you quickly grey out and lighten colors to match their backgrounds, if you're feeling lazy.*

## Evan
Initial step was to layout the thought process of how the game was played and indicate specific steps that were required ie. updating labels and values.

Player clicks a button to place their bet -> Label updates to show Players bet placed
Bet is subtracted from Player's $$ NOTE: If playerMoney = 0, game over! Labels updated
 
DEAL -> Cards get drawn for Player AND Dealer
     -> One Dealer card is shown and one is hidden
     -> The scores of both Dealer and Player are updated; they become the sum of the card values
 
HIT  -> Player draws, updates Player score
     -> I Player score over 21 then game is over, hidden card is revealed, dealer score is updated, label updated to show you lost, playing is set to false.
 
STAND -> Only Dealer draws as much as they want to, Dealer total gets updated ; If              
         Dealer score over 21 then game is over, label updated to show you won,playing set to false.

DOUBLE -> playerBet is doubled IF they have sufficient funds
       -> Reveals the hidden card IF BlackJack and updates Dealer score and GG
       -> Player draws, updates Player score
       -> STAND
 
SPLIT -> Hand splits into two hands
      -> 1st hand gets dealt automatically
      -> Actions then occur to both hands
 
And so I went onto the Bet function, where I made an action out of one button that functioned as a chip in BlackJack, and then made duplicates of that so they all had the same function but sent their own values to add to your total amount that you wanted to Bet, capped at $500 in one go. Afterwards we had to implement the Deal function, which dealt the Player and Dealer their cards by loading their respective card images and updating their total card values.
