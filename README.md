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

I handled the view, almost entirely in storyboard. The game required many different objects on screen, organized in a way that would be both attractive and sensible, whereas earlier projects involved simple user interfaces with an image, a tableview, a grid of programatically generated buttons, or 3 different UIControls arranged down the center. 

Due to the large number of objects, this project served as a crash course on effectively using storyboard constraints and stackviews. 

Although XCode's GUI superficially resembles software like Illustrator, layering objects on top of one another or locking them in position is done very differently, and requires strategy. You always have to think about the view as a whole. I also read up on how to create custom button classes, because the default styling on buttons is very flat and blocky. It makes them look static. Rounded buttons with borders are very common in web design and signal to users that this is an area of the screen that can be clicked. Since XCode's GUI lacks controls for borders, I had to write a custom button class to give the buttons the styling I wanted.
