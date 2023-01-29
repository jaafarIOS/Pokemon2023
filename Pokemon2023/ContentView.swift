//
//  ContentView.swift
//  Pokemon2023
//
//  Created by Jaafar Zubaidi  on 1/25/23.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()

    var body: some View {
        NavigationView {
            
            List {
                ForEach(pokemon) {
                    entry in
                    
                    HStack {
                        PokemonImage(imageLink: "\(entry.url)")
                            .background(.brown).cornerRadius(50.0)
                            .padding(.trailing,20)
                        
                        NavigationLink("\(entry.name)"
                            .capitalized ,destination: Text("Detail view for \(entry.name)").foregroundColor(.red)
                            .font(.system(size: 20.0)).bold)
                    }
                } .background(.green)
            }
           
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
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
