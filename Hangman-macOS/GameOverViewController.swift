//
//  Hangman-macOS
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import Cocoa

class GameOverViewController: NSViewController {
    @IBOutlet weak var gameOverLabel: NSTextField!
    @IBOutlet weak var rightAnswerLabel: NSTextField!
    
    var gameOverText = String()
    var rightAnswerText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.stringValue = gameOverText
        rightAnswerLabel.stringValue = rightAnswerText
    }
    
    @IBAction func playAgainButton(_ sender: NSButton) {
        dismiss(self)
    }
    
    @IBAction func exitButton(_ sender: NSButton) {
        dismiss(self)
        NSApplication.shared.terminate(self)
    }
}
