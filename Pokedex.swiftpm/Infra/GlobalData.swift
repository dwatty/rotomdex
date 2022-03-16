import SwiftUI

class GlobalData: ObservableObject {
    @Published var Pokemon = [PokemonModel]()
        
    init(){
        if let fileURL = Bundle.main.url(forResource: "pokedex", withExtension: "json") {
            if let fileContent = try? String(contentsOf: fileURL) {
                do {
                    let data = Data(fileContent.utf8)
                    let json = try JSONDecoder().decode([PokemonModel].self, from: data)
                    self.Pokemon = json
                }
                catch let jsonErr {
                    print("Error parsing Pokedex")
                    print(jsonErr)
                }
            }
        }
    }
}
