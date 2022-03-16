import SwiftUI

struct StrongAgainstView: View {
    let pokemonType: String
    
    @ViewBuilder
    func getBadges(t:String) -> some View {
        TypeView(pokemonType: t)
    }
    
    func getStrengths() -> [String] {
        if(pokemonType == "Bug") {
            return ["Grass", "Dark", "Psychic"]
        }
        else if(pokemonType == "Dark") {
            return ["Ghost", "Psychic"]
        }
        else if(pokemonType == "Dragon") {
            return ["Dragon"]
        }
        else if(pokemonType == "Electric") {
            return ["Flying", "Water"]
        }
        else if(pokemonType == "Fairy") {
            return ["Fighting", "Dark", "Dragon"]
        }
        else if(pokemonType == "Fighting") {
            return ["Dark", "Ice", "Normal", "Rock", "Steel"]
        }
        else if(pokemonType == "Fire") {
            return ["Bug", "Grass", "Ice", "Steel"]
        }
        else if(pokemonType == "Flying") {
            return ["Bug", "Fighting", "Grass"]
        }
        else if(pokemonType == "Ghost") {
            return ["Ghost", "Psychic"]
        }
        else if(pokemonType == "Grass") {
            return ["Ground", "Rock", "Water"]
        }
        else if(pokemonType == "Ground") {
            return ["Electric", "Fire", "Poison", "Rock", "Steel"]
        }
        else if(pokemonType == "Ice") {
            return ["Dragon", "Flying", "Grass", "Ground"]
        }
        else if(pokemonType == "Normal") {
            return [""]
        }
        else if(pokemonType == "Poison") {
            return ["Fairy", "Grass"]
        }
        else if(pokemonType == "Psychic") {
            return ["Fighting", "Poison"]
        }
        else if(pokemonType == "Rock") {
            return ["Bug", "Fire", "Flying", "Ice"]
        }
        else if(pokemonType == "Steel") {
            return ["Fairy", "Ice", "Rock"]
        }
        else if(pokemonType == "Water") {
            return ["Fire", "Ground", "Rock"]
        }
        else {
            return [""]
        }
    }
    
    var body: some View {
        VStack{
            Text(pokemonType + " Strong Against")
            WrappingHStack(id: \.self, horizontalSpacing: 8) {
                ForEach(getStrengths(), id: \.self) { t in
                    getBadges(t: t).padding(.bottom, 10)
                }
            }
        }
    }
}




