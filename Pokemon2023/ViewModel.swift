////
////  ViewModel.swift
////  Pokemon2023
////
////  Created by Jaafar Zubaidi  on 1/30/23.
////
//
//import Foundation
//import SwiftUI
//
//class ViewModel: ObservableObject {
//    
//    
//    @Published var pokemonList = [Pokemon]()
//    @Published var pokemonDetails: PokemonEntry?
//    
//    func getPokemonIndex(pokemon: Pokemon) -> Int {
//        if let index = self.pokemonList.firstIndex(of: pokemon) {
//            return index + 1
//        }
//        return 0
//    }
//    
//    // Get specific details for a pokemon
//    func getDetails(pokemon: Pokemon) {
//        let id = getPokemonIndex(pokemon: pokemon)
//        
//       self.pokemonDetails = PokemonEntry(name: "", url: "")
//       PokemonSelectedApi().getSprite(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", completion:
//        { data in
//            DispatchQueue.main.async {
//                self.pokemonDetails = data
//            }
//        })
//    }
//}
