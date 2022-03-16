import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var globalModel: GlobalData
    @State var randomPokemon: PokemonModel?
    
    init(){
        Theme.navigationBarColors(background: UIColor.init(hex: "#ee1515ff"), titleColor: .white)
    }
    
    var body: some View {
        VStack{
            if(randomPokemon != nil) {
                
                Text("Know Your Pokemon")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    
                Text(randomPokemon!.name.english)
                    .font(.subheadline)
                
                ZStack{
                    
                    GeometryReader { geometry in
                        ZStack {
                            Circle()
                                .fill(Color(hex: "ee1515"))
                                .frame(width: geometry.size.width, height: geometry.size.width)
                            
                            Circle()
                                .stroke(Color(hex: "ffffff"), lineWidth: 4)
                                .frame(width: geometry.size.width, height: geometry.size.width)
                            
                            Image(Utilities.getImageForId(id: randomPokemon!.id))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300)
                                .padding(8)
                            
                        }.frame(maxWidth: .infinity)
                    }.frame(maxWidth: 350)
                    
                    
                }.padding(8)
                
                Text(randomPokemon!.description)
                    .multilineTextAlignment(.center)
                    .padding()
                    
            }
        }
        .padding()
        .onAppear { 
            getRandomPokemon() 
        }
    }
    
    func getRandomPokemon() {
        
        let id = Int.random(in: 0 ... globalModel.Pokemon.count) + 1
        
        let pkm = globalModel.Pokemon.filter {
            $0.id == id 
        }
        
        randomPokemon = pkm[0]
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(GlobalData())
    }
}

