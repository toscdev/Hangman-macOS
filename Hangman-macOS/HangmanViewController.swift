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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func letterButtonPressed(_ sender: NSButton) {
    }
    
}

