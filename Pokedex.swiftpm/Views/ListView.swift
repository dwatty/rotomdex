import SwiftUI

struct PokemonListView: View {
    
    @EnvironmentObject var globalModel: GlobalData
    @State var list: [PokemonModel]?
    @State private var searchText = ""
    
    init(){
        Theme.navigationBarColors(background: UIColor.init(hex: "#ee1515ff"), titleColor: .white)
    }
    
    var body: some View {
        NavigationView {
            mainContent
                .task {
                    fetchPokemon()
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color.white)
    }
    
    var mainContent: some View {
        VStack {
            List {
                ForEach(searchResults, id: \.id) { pokemon in
                    NavigationLink(destination:DetailsView(pkItem: pokemon) ) {
                        HStack {
                            PokemonCircleView(pokemonId: pokemon.id)
                            Text("#\(String(format: "%04d", pokemon.id))")
                            Text(pokemon.name.english)
                                .font(.headline)
                        }
                        .padding(7)
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .disableAutocorrection(true)
            .navigationTitle("Pokemon")
            .listStyle(.plain)
        }
    }
    
    var searchResults: [PokemonModel] {
        if searchText.isEmpty {
            return list ?? []
        } else {
            if let l = list {
                
                return l.filter { 
                    $0.name.english.contains(searchText) 
                }
            }
            else {
                return []
            }
            
        }
    }
    
    // MARK: - Data
    func fetchPokemon()  {
        list = globalModel.Pokemon
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
            .environmentObject(GlobalData())
    }
}
