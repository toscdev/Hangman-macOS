//
//  Hangman-macOS
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import Foundation

enum Category: String {
    case actor = "Actor"
    case athlete = "Athlete"
    case noun = "Noun"
    case politician = "Politician"
}

struct Word {
    let toGuess: String
    let category: Category
}

struct WordProvider {
    let words = [
        Word(toGuess: "Leonardo DiCaprio", category: .actor),
        Word(toGuess: "Jennifer Aniston", category: .actor),
        Word(toGuess: "Sandra Bullock", category: .actor),
        Word(toGuess: "Tom Hanks", category: .actor),
        Word(toGuess: "Usain Bolt", category: .athlete),
        Word(toGuess: "Dirk Nowitzki", category: .athlete),
        Word(toGuess: "Lionel Messi", category: .athlete),
        Word(toGuess: "Steffi Graf", category: .athlete),
        Word(toGuess: "Vehicle", category: .noun),
        Word(toGuess: "Flower", category: .noun),
        Word(toGuess: "Mountain", category: .noun),
        Word(toGuess: "Window", category: .noun),
        Word(toGuess: "Barack Obama", category: .politician),
        Word(toGuess: "Angela Merkel", category: .politician),
        Word(toGuess: "Donald Trump", category: .politician),
        Word(toGuess: "Emmanuel Macron", category: .politician)
    ]
}

