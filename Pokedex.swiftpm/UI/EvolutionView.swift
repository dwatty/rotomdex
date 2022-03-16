import SwiftUI

struct EvolutionView: View {
    
    @EnvironmentObject var globalModel: GlobalData
    @State private var isShowingDetailView = false
    @State private var selectedPokemon = PokemonModel( 
        id: 1,
        name: NameModel(english: ""),
        description: "",
        type: [""],
        evolution: EvolutionModel()
    )
      
    let evolutions: EvolutionModel
    
    func getPokemon(id: String) -> PokemonModel? {
        let idInt = Int(id)
        let pkm = globalModel.Pokemon.filter {
            $0.id == idInt 
        }
        
        if !pkm.isEmpty {
            return pkm[0]
        }
        
        return nil
    }
    
    func getName (id: String) -> String {
        let pkm = getPokemon(id: id)
        if let p = pkm {
            return p.name.english
        }
        
        return "-"
    }
    
    var body: some View {
        
        NavigationLink(
            destination: DetailsView(pkItem: selectedPokemon),
            isActive: $isShowingDetailView
        ) {
            EmptyView()
        }
        
        VStack{
            
            Text("Evolutions")
                .font(.largeTitle)
            
            HStack{
                
                if(evolutions.prev[0] != "N/A"){
                    Image(systemName: "arrowshape.turn.up.left.fill")
                }
                
                Text(getName(id: evolutions.prev[0]))
                    .onTapGesture{
                        let pkm = getPokemon(id: evolutions.prev[0])
                        if let sel = pkm {
                            self.selectedPokemon = sel
                            self.isShowingDetailView = true
                        }
                    }
                    .frame(width: 100, height: 20, alignment: .leading)
                
                Spacer()
                
                Text(evolutions.prev[1])
            }
            
            Rectangle()
                .frame(width: .infinity, height:1)
            
            ForEach(evolutions.next, id: \.self) { nextEv in
                
                HStack {
                    
                    if(nextEv[0] != "N/A"){
                        Image(systemName: "arrowshape.turn.up.right.fill")
                    }
                    
                    Text(getName(id: nextEv[0]))
                        .onTapGesture{
                            let pkm = getPokemon(id: nextEv[0])
                            if let sel = pkm {
                                self.selectedPokemon = sel
                                self.isShowingDetailView = true
                            }
                        }
                        .frame(width: 100, height: 20, alignment: .leading)
                
                    
                    Spacer()
                
                    Text(nextEv[1])
                        .multilineTextAlignment(.trailing)
                    
                }
                
                Rectangle()
                    .frame(width: .infinity, height:1)
                
            }.padding(2)
                
        }.padding()
    }
}
