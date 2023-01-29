//
//  Model.swift
//  Pokemon2023
//
//  Created by Jaafar Zubaidi  on 1/29/23.
//

import Foundation
struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites : Codable {
    var front_default: String?
}

struct Pokemon : Codable{
    var results: [PokemonEntry]
}

struct PokemonEntry : Codable, Identifiable  {
    let id = UUID()
    var name: String
    var url: String
}
