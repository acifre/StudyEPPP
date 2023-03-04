//
//  Flashcard.swift
//  StudyEPPP
//
//  Created by Anthony Cifre on 3/4/23.
//

import CoreData
import Foundation
import SwiftUI


class Flashcard: NSManagedObject, Codable {
    @NSManaged var term: String
    @NSManaged var definition: String

    enum CodingKeys: String, CodingKey {
        case term
        case definition
    }

    required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.term = try container.decode(String.self, forKey: .term)
        self.definition = try container.decode(String.self, forKey: .definition)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(term, forKey: .term)
        try container.encode(definition, forKey: .definition)
    }

    enum DecoderConfigurationError: Error {
        case missingManagedObjectContext
    }
}
