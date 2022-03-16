import SwiftUI

struct DetailsView: View {
    
    var pkItem: PokemonModel
     
    init(pkItem: PokemonModel){
        Theme.navigationBarColors(background: UIColor.init(hex: "#ee1515ff"), titleColor: .white)
        
        self.pkItem = pkItem
    }
    
    var body: some View {
        ScrollView{
            VStack {
            
                HStack {
                    ForEach(pkItem.type, id: \.self) { t in
                        TypeView(pokemonType: t)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color(hex: "ee1515"))
            
                ZStack  {
                    
                    GeometryReader { geometry in
                        ZStack {
                            Circle()
                                .trim(from: 0, to: 0.5)
                                .fill(Color(hex: "ee1515"))
                                .frame(width: geometry.size.width, height: geometry.size.width)
                                .position(x: geometry.size.width/2, y: -10)
                        
                            Circle()
                                .trim(from: 0, to: 0.5)
                                .stroke(Color(hex: "ee1515"), lineWidth: 4)
                                .frame(width: geometry.size.width, height: geometry.size.width)
                                .position(x: geometry.size.width/2, y: -10)
                        }.frame(maxWidth: .infinity)
                    }
                
                    VStack {
                
                        VStack {
                            Image(Utilities.getPaddedImageName(id: pkItem.id))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300)
                                .padding(8)
                    
                            Spacer()
                    
                            Text(pkItem.description)
                                .padding()
                    
                            Spacer()
                    
                            Text("Strengths").font(.largeTitle)
                    
                            VStack {
                                ForEach(pkItem.type, id: \.self) { t in
                                    StrongAgainstView(pokemonType: t)
                                }
                            }
                            .frame(maxWidth: .infinity)
                    
                            Text("Weaknesses").font(.largeTitle)
                    
                            VStack {
                                ForEach(pkItem.type, id: \.self) { t in
                                    WeakAgainstView(pokemonType: t)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                
                        EvolutionView(evolutions: pkItem.evolution)
                    }
                }
            }
        }
        .navigationBarTitle(pkItem.name.english)
        .navigationBarTitleDisplayMode(.large)
    }
}
