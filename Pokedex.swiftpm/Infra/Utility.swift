import SwiftUI

class Utilities {
    
    static func getImageForId(id : String) -> String {
        let img = String(String(id.reversed()).padding(toLength: 3, withPad: "0", startingAt: 0).reversed())
        
        return img
    }
    
    static func getImageForId(id : Int) -> String {
        let strId = String(id)
        return self.getImageForId(id: strId)
    }
    
    static func getPaddedImageName(id:Int) -> String {
        let strId = String(id)
        
        let img = String(String(strId.reversed()).padding(toLength: 3, withPad: "0", startingAt: 0).reversed())
        
        return img
    }
    
}
