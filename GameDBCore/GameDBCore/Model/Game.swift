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
    public var results: [Game]

    public init(count: Int, next: String, previous: String, results: [Game]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

public struct Game: Codable {
    public var id: Int
    public var slug: String
    public var name: String
    public var released: String
    public var tba: Bool
    public var backgroundImage: String
    public var rating: Float
    public var ratingTop: Int
    public var ratingsCount: Int
    public var added: Int
    public var playtime: Int
    public var suggestionsCount: Int

    public init(id: Int, slug: String, name: String, released: String, tba: Bool, backgroundImage: String, rating: Float, ratingTop: Int, ratingsCount: Int, added: Int, playtime: Int, suggestionsCount: Int) {
        self.id = id
        self.slug = slug
        self.name = name
        self.released = released
        self.tba = tba
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.ratingTop = ratingTop
        self.ratingsCount = ratingsCount
        self.added = added
        self.playtime = playtime
        self.suggestionsCount = suggestionsCount
    }
}
