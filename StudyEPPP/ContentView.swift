//
//  ContentView.swift
//  StudyEPPP
//
//  Created by Anthony Cifre on 3/4/23.
//

swift
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Flashcard.entity(), sortDescriptors: []) var flashcards: FetchedResults<Flashcard>

    @State private var deck: Deck?

    var body: some View {
        NavigationView {
            VStack {
                if deck != nil {
                    // Show current flashcard
                    Text(deck!.flashcards[0].term)
                        .font(.largeTitle)
                    Text(deck!.flashcards[0].definition)
                        .font(.title)
                }
                Spacer()
                HStack {
                    Button("Previous") {
                        // Go to previous flashcard
                    }
                    .padding()
                    Button("Flip") {
                        // Flip current flashcard
                    }
                    .padding()
                    Button("Next") {
                        // Go to next flashcard
                    }
                    .padding()
                }
            }
            .padding()
            .navigationBarTitle(Text("Flashcards"))
            .navigationBarItems(trailing: Button("Shuffle") {
                // Shuffle flashcards
            })
        }
        .onAppear {
            // Load flashcards on app launch
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
