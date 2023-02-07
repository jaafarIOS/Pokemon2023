//
//  PokemonPictures.swift
//  Pokemon2023
//
//  Created by Jaafar Zubaidi  on 1/25/23.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    var size: CGSize
    @State private var pokemonSprite = ""
    
    var body: some View {
        
        AsyncImage(url: URL(string: pokemonSprite)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .onAppear {
            let loadedData = UserDefaults.standard.string(forKey: imageLink)

            if loadedData == nil {
                getSprite(url: imageLink)
                UserDefaults.standard.set(imageLink, forKey: imageLink)
                //print("New url!!! Caching...")
            } else {
                getSprite(url: loadedData!)
                //print("Using cached url...")
            }
            //print(pokemonSprite)
        }
        .padding(Device.isIpad ? 24.0 : 16.0)
        .frame(width: size.width, height: size.height)
        .foregroundColor(Color.gray.opacity(0.60))
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        PokemonSelectedApi().getSprite(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
        
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage(size: CGSize(width: 75, height: 75))
            .previewInterfaceOrientation(.portrait)
    }
}
