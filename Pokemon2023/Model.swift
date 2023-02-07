//
//  Model.swift
//  Pokemon2023
//
//  Created by Jaafar Zubaidi  on 1/29/23.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites:  PokemonSprites
    var weight: Int
}

struct PokemonSprites : Codable {
    var front_default: String?
}

struct Pokemon : Codable{
    var results: [PokemonEntry]
}
struct Details: Codable {
    let base_experience: Int
    let height: Int
    let weight: Int
  
    
    let moves: [Move]
    let stats: [Stats]
}

struct Move: Codable, Identifiable {
    let move: PokemonEntry
    var id: String {
        return move.name
    }
}
struct Stats: Codable, Identifiable {
    let base_stat: Int
    let effort: Int
    let stat: PokemonEntry
    var id: String {
        return stat.name
    }  
}
struct PokemonEntry: Codable, Identifiable  {
    var id: String { return name }
    var name: String
    var url: String
}

class PokemonDetails: Codable, Identifiable {
    let entry: PokemonEntry
    let details: Details
  
    init(entry: PokemonEntry, details: Details) {
        self.entry = entry
        self.details = details
       
    }
    var id: String {
        return entry.name
    }
}
