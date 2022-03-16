import SwiftUI

@main
struct MyApp: App {
    
    var body: some Scene {
        WindowGroup {
            let globalModel = GlobalData()
            
            TabView{
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                    .environmentObject(globalModel)
                
                PokemonListView()
                    .tabItem{
                        Label("Pokemon", systemImage: "list.dash")
                    }
                    .environmentObject(globalModel)
                
                QuizView()
                    .tabItem{
                        Label("Quiz", systemImage: "questionmark.square")
                    }
                    .environmentObject(globalModel)
                
            }
        }
    }
}

