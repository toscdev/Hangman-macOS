//
//  Hangman-macOS
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import Cocoa

/// The structure SingleLetter consists of a single letter and a boolean value whether this character is revealed.
struct SingleLetter {
    var character: String
    var isRevealed: Bool
}

class HangmanViewController: NSViewController {

    @IBOutlet weak var wordToGuessLabel: NSTextField!
    @IBOutlet weak var categoryLabel: NSTextField!
    
    @IBOutlet weak var life1: NSImageView!
    @IBOutlet weak var life2: NSImageView!
    @IBOutlet weak var life3: NSImageView!
    @IBOutlet weak var life4: NSImageView!
    @IBOutlet weak var life5: NSImageView!
    @IBOutlet weak var life6: NSImageView!
    
    @IBOutlet weak var letterAButton: NSButton!
    @IBOutlet weak var letterBButton: NSButton!
    @IBOutlet weak var letterCButton: NSButton!
    @IBOutlet weak var letterDButton: NSButton!
    @IBOutlet weak var letterEButton: NSButton!
    @IBOutlet weak var letterFButton: NSButton!
    @IBOutlet weak var letterGButton: NSButton!
    @IBOutlet weak var letterHButton: NSButton!
    @IBOutlet weak var letterIButton: NSButton!
    @IBOutlet weak var letterJButton: NSButton!
    @IBOutlet weak var letterKButton: NSButton!
    @IBOutlet weak var letterLButton: NSButton!
    @IBOutlet weak var letterMButton: NSButton!
    @IBOutlet weak var letterNButton: NSButton!
    @IBOutlet weak var letterOButton: NSButton!
    @IBOutlet weak var letterPButton: NSButton!
    @IBOutlet weak var letterQButton: NSButton!
    @IBOutlet weak var letterRButton: NSButton!
    @IBOutlet weak var letterSButton: NSButton!
    @IBOutlet weak var letterTButton: NSButton!
    @IBOutlet weak var letterUButton: NSButton!
    @IBOutlet weak var letterVButton: NSButton!
    @IBOutlet weak var letterWButton: NSButton!
    @IBOutlet weak var letterXButton: NSButton!
    @IBOutlet weak var letterYButton: NSButton!
    @IBOutlet weak var letterZButton: NSButton!
    
    let wordProvider = WordProvider()
    var currentWord: Word?
    var hiddenWord: [SingleLetter]?
    var numberOfLifes = 6
    var gameOverMessage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func letterButtonPressed(_ sender: NSButton) {
        sender.isEnabled = false
        if checkIfCharacterIsInWord(char: sender.title) {
            revealCharacterInLabel(sender.title)
            if checkIfAllCharactersRevealed() {
                gameOver(playerHasWon: true)
            }
        } else {
            removeLife()
        }
    }
    
    /// Starts the game by setting a word to guess.
    func startGame() {
        if currentWord == nil {
            setNewWord()
        }
        if let currentWord = currentWord {
            wordToGuessLabel.stringValue = wordToUnderscores(currentWord.toGuess)
            setCategoryLabelText(currentWord.category)
            hiddenWord = wordToSingleLetterArray(word: currentWord.toGuess)
        }
    }
    
    /// Gets a random word from WordProvider and sets it as the word to be guessed.
    func setNewWord() {
        if let newWord = wordProvider.words.randomElement() {
            currentWord = Word(toGuess: newWord.toGuess.uppercased(), category: newWord.category)
        }
    }
    
    /// Creates a string which only has underscores instead of letters. The underscores are separated by spaces.
    /// - Parameter wordToGuess: The word to be replaced by underscores.
    /// - Returns: A string with underscores.
    func wordToUnderscores(_ wordToGuess: String) -> String {
        var wordInUnderscores = ""
        for character in wordToGuess {
            if character == " " {
                wordInUnderscores.append("  ")
            } else {
                wordInUnderscores.append("_ ")
            }
        }

        return wordInUnderscores.trimmingCharacters(in: .whitespaces)
    }
    
    /// Sets the text of the category label with the prefix 'Category: '.
    /// - Parameter category: The category is displayed in the label.
    func setCategoryLabelText(_ category: Category) {
        categoryLabel.stringValue = "Category: \(category.rawValue)"
    }
    
    /// Checks if the selected character is in the word to guess.
    /// - Parameter char: The selected character.
    /// - Returns: true, if the selected character is in the word to guess; false, if not.
    func checkIfCharacterIsInWord(char: String) -> Bool {
        if let currentWord = currentWord {
            if currentWord.toGuess.contains(char) {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    /// Checks if all characters are revealed.
    /// - Returns: true, if all characters are revealed; false if not all characters are revealed.
    func checkIfAllCharactersRevealed() -> Bool {
        if wordToGuessLabel.stringValue.contains("_") {
            return false
        } else {
            return true
        }
    }
    
    /// Reveals the character at the correct positions in the label.
    /// - Parameter char: The character to be revealed.
    func revealCharacterInLabel(_ char: String) {
        if var wordToGuess = hiddenWord {
            for (index, character) in wordToGuess.enumerated() {
                if character.character == char {
                    wordToGuess[index].isRevealed = true
                }
            }
            hiddenWord = wordToGuess
            
            var newStringValue = ""
            for (_, character) in wordToGuess.enumerated() {
                if character.isRevealed {
                    newStringValue.append("\(character.character) ")
                } else {
                    if character.character == " " {
                        newStringValue.append("  ")
                    } else {
                        newStringValue.append("_ ")
                    }
                }
            }
            wordToGuessLabel.stringValue = newStringValue.trimmingCharacters(in: .whitespaces)
        }
    }
    
    /// Creates an array of SingleLetter from the 'word' parameter.
    /// - Parameter word: The word to guess.
    /// - Returns: An array of SingleLetter.
    func wordToSingleLetterArray(word: String) -> [SingleLetter] {
        var singleLetters = [SingleLetter]()
        
        for char in word {
            singleLetters.append(SingleLetter(character: "\(char)", isRevealed: false))
        }
        
        return singleLetters
    }
    
    /// Decreases life by 1 if the character selected by the user is not in the word to guess.
    func removeLife() {
        switch numberOfLifes {
        case 6:
            setLifeEmptyImage(named: life6)
            numberOfLifes -= 1
        case 5:
            setLifeEmptyImage(named: life5)
            numberOfLifes -= 1
        case 4:
            setLifeEmptyImage(named: life4)
            numberOfLifes -= 1
        case 3:
            setLifeEmptyImage(named: life3)
            numberOfLifes -= 1
        case 2:
            setLifeEmptyImage(named: life2)
            numberOfLifes -= 1
        case 1:
            setLifeEmptyImage(named: life1)
            gameOver(playerHasWon: false)
        default: // The default case is never used
            ()
        }
    }
    
    /// Sets the image of the life status bar.
    /// - Parameter named: The NSImageView which shall be set.
    func setLifeEmptyImage(named: NSImageView) {
        named.image = NSImage(named: "heart-empty")
    }
    
    /// Shows the game end screen.
    /// - Parameter playerHasWon: true, if the player completely revealed the word without running out of lives; false if the lives drop to zero.
    func gameOver(playerHasWon: Bool) {
        if playerHasWon {
            gameOverMessage = "You win!"
            self.performSegue(withIdentifier: "GameOverSegue", sender: self)
            startNewGame()
        } else {
            gameOverMessage = "You lose :("
            self.performSegue(withIdentifier: "GameOverSegue", sender: self)
            startNewGame()
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "GameOverSegue" {
            if let gameOverVC = segue.destinationController as? GameOverViewController {
                gameOverVC.gameOverText = gameOverMessage
                if let currentWord = currentWord {
                    gameOverVC.rightAnswerText = currentWord.toGuess
                }
            }
        }
    }
    
    /// Reset the GUI and prepare for a new game.
    func startNewGame() {
        letterAButton.isEnabled = true
        letterBButton.isEnabled = true
        letterCButton.isEnabled = true
        letterDButton.isEnabled = true
        letterEButton.isEnabled = true
        letterFButton.isEnabled = true
        letterGButton.isEnabled = true
        letterHButton.isEnabled = true
        letterIButton.isEnabled = true
        letterJButton.isEnabled = true
        letterKButton.isEnabled = true
        letterLButton.isEnabled = true
        letterMButton.isEnabled = true
        letterNButton.isEnabled = true
        letterOButton.isEnabled = true
        letterPButton.isEnabled = true
        letterQButton.isEnabled = true
        letterRButton.isEnabled = true
        letterSButton.isEnabled = true
        letterTButton.isEnabled = true
        letterUButton.isEnabled = true
        letterVButton.isEnabled = true
        letterWButton.isEnabled = true
        letterXButton.isEnabled = true
        letterYButton.isEnabled = true
        letterZButton.isEnabled = true
        
        life1.image = NSImage(named: "heart-full")
        life2.image = NSImage(named: "heart-full")
        life3.image = NSImage(named: "heart-full")
        life4.image = NSImage(named: "heart-full")
        life5.image = NSImage(named: "heart-full")
        life6.image = NSImage(named: "heart-full")
        
        numberOfLifes = 6
        currentWord = nil
        
        startGame()
    }
}
