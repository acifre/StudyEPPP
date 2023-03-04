//
//  Deck.swift
//  StudyEPPP
//
//  Created by Anthony Cifre on 3/4/23.
//

import Foundation
import SwiftUI

class Deck {
    var flashcards: [Flashcard] = []

    init(flashcards: [Flashcard]) {
        self.flashcards = flashcards
    }

    func shuffle() {
        flashcards.shuffle()
    }
}

