import SwiftUI

struct PokemonModel: Codable {
    let id: Int
    let name: NameModel
    let description: String
    let type: [String]
    let evolution: EvolutionModel
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case type
        case evolution
    }
}
