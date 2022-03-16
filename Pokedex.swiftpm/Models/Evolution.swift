import SwiftUI

class EvolutionModel: Codable {
    var prev: [String] = ["N/A","No Previous Evolutions"]
    var next: [[String]] = [["N/A","No Next Evolutions"]]
    
    enum CodingKeys: String, CodingKey {
        case prev
        case next
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let previous = try container.decodeIfPresent([String].self, forKey: .prev) {
            self.prev = previous
        }
        
        if let next = try container.decodeIfPresent([[String]].self, forKey: .next) {
            self.next = next
        }
    }
    
    init() {
        self.prev = []
        self.next = [[]]
    }
}
