import SwiftUI

struct TypeView: View {
    let pokemonType: String
    
    @ViewBuilder
    func getTextLabel(color : Color) -> some View {
        if(pokemonType == ""){
            Text("None")
                .padding(8)
                .background(color)
                .cornerRadius(10)
        }
        else { 
            Text(pokemonType)
                .padding(8)
                .background(color)
                .cornerRadius(10)
        }
    }
    
    @ViewBuilder
    func getView() -> some View {
        if(pokemonType == "Normal") {
            getTextLabel(color: Color(hex: "A8A878"))
        }
        else if(pokemonType == "Electric") {
            getTextLabel(color: Color(hex: "F8D030"))
        }
        else if(pokemonType == "Fire") {
            getTextLabel(color: Color(hex: "F08030"))
        }
        else if(pokemonType == "Water") {
            getTextLabel(color: Color(hex: "6890F0"))
        }
        else if(pokemonType == "Grass") {
            getTextLabel(color: Color(hex: "78C850"))
        }
        else if(pokemonType == "Poison") {
            getTextLabel(color: Color(hex: "A040A0"))
        }
        else if(pokemonType == "Bug") {
            getTextLabel(color: Color(hex: "A8B820"))
        }
        else if(pokemonType == "Ground") {
            getTextLabel(color: Color(hex: "E0C068"))
        }
        else if(pokemonType == "Fighting") {
            getTextLabel(color: Color(hex: "C03028"))
        }
        else if(pokemonType == "Flying") {
            getTextLabel(color: Color(hex: "A890F0"))
        }
        else if(pokemonType == "Psychic") {
            getTextLabel(color: Color(hex: "F85888"))
        }
        else if(pokemonType == "Rock") {
            getTextLabel(color: Color(hex: "B8A038"))
        }
        else if(pokemonType == "Ice") {
            getTextLabel(color: Color(hex: "98D8D8"))
        }
        else if(pokemonType == "Dragon") {
            getTextLabel(color: Color(hex: "7038F8"))
        }
        else if(pokemonType == "Ghost") {
            getTextLabel(color: Color(hex: "705898"))
        }
        else if(pokemonType == "Dark") {
            getTextLabel(color: Color(hex: "705848"))
        }
        else if(pokemonType == "Steel") {
            getTextLabel(color: Color(hex: "B8B8D0"))
        }
        else if(pokemonType == "Fairy") {
            getTextLabel(color: Color(hex: "EE99AC"))
        }
        else {
            getTextLabel(color: Color(hex: "cccccc"))
        }
    }
    
    var body: some View {
        getView().padding(.bottom, 10)
    }
}


