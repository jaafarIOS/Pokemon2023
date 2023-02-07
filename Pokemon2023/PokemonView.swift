//
//  Pokemon.swift
//  Pokemon2023
//
//  Created by Jaafar Zubaidi  on 1/25/23.
//

import Foundation

class PokeApi {
    func getData(completion: @escaping ([PokemonDetails]) -> ()) {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            //print("Pokemon list: \(pokemonList)")
            var result: [PokemonDetails] = []
            
            let dispatchGroup: DispatchGroup = DispatchGroup()
            for pokemon in pokemonList.results {
                dispatchGroup.enter()
                self.getDetails(pokemon: pokemon) { details in
                    dispatchGroup.leave()
                    result.append(PokemonDetails(entry: pokemon, details: details))
                }
            }
            dispatchGroup.notify(queue: .main) {
                completion(result)
            }
        }.resume()
    }
    
    func getDetails(pokemon: PokemonEntry, completion:@escaping (Details) -> ()){
        guard let url = URL(string: pokemon.url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(Details.self, from: data)
          
            DispatchQueue.main.async {
                completion(pokemonList)
            }
        }.resume()
    }
}
