//
//  ContentView.swift
//  Pokemon2023
//
//  Created by Jaafar Zubaidi  on 1/25/23.
//

import SwiftUI

struct ContentView: View {
    @State var pokemons: [PokemonDetails] = []

    var body: some View {
        NavigationView {
          
            List(pokemons) { pokemon in
                HStack {
                    PokemonImage(imageLink: "\(pokemon.entry.url)",
                                 size: CGSize(width: 100, height: 100))
                        .background(.brown)
                        .cornerRadius(50.0)
                        .padding(.trailing,20)
                    
                    NavigationLink("\(pokemon.entry.name)".capitalized) {
                        // -- Here starts the detail view --
                        
                        VStack {
                            PokemonImage(imageLink: "\(pokemon.entry.url)",
                                         size: CGSize(width: 300, height: 250))
                                .background(.gray)
                                .cornerRadius(30.0)
                                .padding(.horizontal, Device.isIpad ? 24.0 : 16.0)
                            // You can add more information here like this
                            List {
                                Section("Details") {
                                    Text("Base experience: \(pokemon.details.base_experience)").backgroundStyle(.gray)
                                    Text("Weight: \(pokemon.details.weight)")
                                    Text("Height: \(pokemon.details.height)")
                                }
                                    
                                
                                Section("Moves") {
                                    ForEach(pokemon.details.moves) { move in
                                        Text(move.move.name.capitalized)
                                    }
                                }
                                Section("Stats") {
                                  
                                    ForEach(pokemon.details.stats) { stat in
                                        HStack {
                                            Text(stat.stat.name.capitalized)
                                            Spacer()
                                            Text("\(stat.base_stat)")
                                        }
                                    }
                                }
                            }
                        }
                        .navigationTitle(pokemon.entry.name.capitalized)

                        // -- Here ends the detail view --
                    }
                }
            }
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemons = pokemon
                }
            }
            .navigationTitle("Pokemon SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
