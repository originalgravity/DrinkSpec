//
//  Data.swift
//  Mojo
//
//  Created by James Evans on 22/04/2020.
//  Copyright © 2020 James Evans. All rights reserved.
//

import SwiftUI

struct Cocktail: Codable, Equatable, Identifiable, Hashable {
    var id = UUID()
    var name: String
    var category: String
    var description: String
    var methodShort: String
    var glassware: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }

    #if DEBUG
    static let example = Cocktail(id: UUID(), name: "zombie", category: "Mojo", description: "Tequila. Lime. Sugar.", methodShort: "Method", glassware: "Martini")
    #endif
}

struct Category: Codable, Equatable, Identifiable, Hashable {
    var id = UUID()
    var catslug :String
    var name: String
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }

    #if DEBUG
    static let example = Category(id: UUID(), catslug: "Mojo Blue", name: "Mojo Blue")
    #endif
}
