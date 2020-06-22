//
//  Game.swift
//  GameDBCore
//
//  Created by Dwi Randy Herdinanto on 07/06/20.
//  Copyright © 2020 dwirandyh. All rights reserved.
//

import Foundation

struct GameListResult: Codable {
    public var count: Int
    public var next: String?
    public var previous: String?
    public var results: [Game]?
    
    public init(count: Int, next: String, previous: String, results: [Game]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

public struct Game: Codable {
    public var id: Int?
    public var slug: String?
    public var name: String?
    public var description: String?
    public var released: String?
    public var tba: Bool?
    public var backgroundImage: String?
    public var backgroundImageAdditional: String?
    public var rating: Float?
    public var ratingTop: Int?
    public var ratingsCount: Int?
    public var added: Int?
    public var playtime: Int?
    public var suggestionsCount: Int?
    public var parentPlatforms: [ParentPlatform]?
    
    public init(id: Int?, slug: String?, name: String?, description: String?, released: String?, tba: Bool?, backgroundImage: String?, backgroundImageAdditional: String?, rating: Float?, ratingTop: Int?, ratingsCount: Int?, added: Int?, playtime: Int?, suggestionsCount: Int?) {
        self.id = id
        self.slug = slug
        self.name = name
        self.description = description
        self.released = released
        self.tba = tba
        self.backgroundImage = backgroundImage
        self.backgroundImageAdditional = backgroundImageAdditional
        self.rating = rating
        self.ratingTop = ratingTop
        self.ratingsCount = ratingsCount
        self.added = added
        self.playtime = playtime
        self.suggestionsCount = suggestionsCount
    }
    
    public static var defaultValue: Game {
        return Game(id: 0, slug: "", name: "", description: "" , released: "", tba: false, backgroundImage: "", backgroundImageAdditional: "" , rating: 5, ratingTop: 5, ratingsCount: 0, added: 0, playtime: 0, suggestionsCount: 0)
    }
}

public struct ParentPlatform: Codable {
    public var platform: Platform?
}

public struct Platform: Codable {
    public var id: Int?
    public var name: String?
    public var slug: String?
}
