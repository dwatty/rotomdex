import SwiftUI

struct PokemonCircleView: View {
    let pokemonId: Int
        
    
    var body: some View {
        ZStack {
            Image(Utilities.getPaddedImageName(id: pokemonId))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:50, height:50)
                .background(
                    ZStack {
                        Circle().fill(Color.white)
                        
                        Circle().stroke(Color(hex: "ee1515"), lineWidth: 4)
                    }
                    
                )
        }
    }
}
