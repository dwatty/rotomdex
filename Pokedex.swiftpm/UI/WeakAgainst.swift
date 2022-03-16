import SwiftUI

struct WeakAgainstView: View {
    let pokemonType: String
    
    @ViewBuilder
    func getBadges(t:String) -> some View {
        TypeView(pokemonType: t)
    }
    
    func getStrengths() -> [String] {
        if(pokemonType == "Bug") {
            return ["Fire", "Flying", "Rock"]
        }
        else if(pokemonType == "Dark") {
            return ["Bug", "Fairy", "Fighting"]
        }
        else if(pokemonType == "Dragon") {
            return ["Dragon", "Fairy", "Ice"]
        }
        else if(pokemonType == "Electric") {
            return ["Ground"]
        }
        else if(pokemonType == "Fairy") {
            return ["Poison", "Steel"]
        }
        else if(pokemonType == "Fighting") {
            return ["Fairy", "Flying", "Psychic"]
        }
        else if(pokemonType == "Fire") {
            return ["Ground", "Rock", "Water"]
        }
        else if(pokemonType == "Flying") {
            return ["Electric", "Ice", "Rock"]
        }
        else if(pokemonType == "Ghost") {
            return ["Dark", "Ghost"]
        }
        else if(pokemonType == "Grass") {
            return ["Bug", "Fire", "Flying", "Ice", "Poison"]
        }
        else if(pokemonType == "Ground") {
            return ["Grass", "Ice", "Water"]
        }
        else if(pokemonType == "Ice") {
            return ["Fighting", "Fire", "Rock", "Steel"]
        }
        else if(pokemonType == "Normal") {
            return ["Fighting"]
        }
        else if(pokemonType == "Poison") {
            return ["Ground", "Psychic"]
        }
        else if(pokemonType == "Psychic") {
            return ["Bug", "Dark", "Ghost"]
        }
        else if(pokemonType == "Rock") {
            return ["Fighting", "Grass", "Ground", "Steel", "Water"]
        }
        else if(pokemonType == "Steel") {
            return ["Fighting", "Fire", "Ground"]
        }
        else if(pokemonType == "Water") {
            return ["Electric", "Grass"]
        }
        else {
            return [""]
        }
    }
    
    var body: some View {
        VStack{
            Text(pokemonType + " Weak Against")
            WrappingHStack(id: \.self, horizontalSpacing: 6) { 
                ForEach(getStrengths(), id: \.self) { t in
                    getBadges(t: t).padding(.bottom, 10)
                }
            }
        }
    }
}

