//
//  Hangman-macOS
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import Cocoa

class HangmanViewController: NSViewController {

    @IBOutlet weak var wordToGuessLabel: NSTextField!
    @IBOutlet weak var categoryLabel: NSTextField!
    @IBOutlet weak var life1: NSImageView!
    @IBOutlet weak var life2: NSImageView!
    @IBOutlet weak var life3: NSImageView!
    @IBOutlet weak var life4: NSImageView!
    @IBOutlet weak var life5: NSImageView!
    @IBOutlet weak var life6: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func letterButtonPressed(_ sender: NSButton) {
    }
    
}

