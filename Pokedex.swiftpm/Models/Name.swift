import SwiftUI

struct NameModel: Codable {
    let english: String
    
    enum CodingKeys: String, CodingKey {
        case english
    }
}
