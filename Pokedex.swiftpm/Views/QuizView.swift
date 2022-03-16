import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var globalModel: GlobalData
    @State var correct: PokemonModel?
    @State var options : [PokemonModel]?
    @State var showAlert = false
    @State var imageType = Image.TemplateRenderingMode.template
    @State var alertMsg = "You're Right!!!"
    @State var alertBody = ""
    @State var currentStreak = 0
    
    init(){
        Theme.navigationBarColors(background: UIColor.init(hex: "#ee1515ff"), titleColor: .white)
    }
    
    var body: some View {
        VStack{
            if(correct != nil) {
                
                Text("Who's That Pokemon?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                ZStack{
                    
                    GeometryReader { geometry in
                        ZStack {
                            Circle()
                                .fill(Color(hex: "ee1515"))
                                .frame(width: geometry.size.width, height: geometry.size.width)
                            
                            Circle()
                                .stroke(Color(hex: "ffffff"), lineWidth: 4)
                                .frame(width: geometry.size.width, height: geometry.size.width)
                            
                            Image(Utilities.getImageForId(id: correct!.id))
                                .resizable()
                                .renderingMode(imageType)
                                .aspectRatio(contentMode: .fit)
                                .padding(8)
                                .frame(maxWidth: 300)
                                .foregroundColor(.black)
                            
                        }.frame(maxWidth: .infinity)
                    }.frame(maxWidth: 350)
                    
                }
                .padding(8)
                
                VStack {
                    HStack {
                        
                        Button(action: {
                            doSelection(opt: options![0].id)
                        }) {
                            Text(options![0].name.english)
                                .padding()
                                .background(Color(hex: "ee1515"))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(hex: "8b0000"), lineWidth: 2)
                                )
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            doSelection(opt: options![1].id)
                        }) {
                            Text(options![1].name.english)
                                .padding()
                                .background(Color(hex: "ee1515"))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(hex: "8b0000"), lineWidth: 2)
                                )
                        }
                        
                    }.padding()
                    
                    HStack {
                        Button(action: {
                            doSelection(opt: options![2].id)
                        }) {
                            Text(options![2].name.english)
                                .padding()
                                .background(Color(hex: "ee1515"))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(hex: "8b0000"), lineWidth: 2)
                                )
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            doSelection(opt: options![3].id)
                        }) {
                            Text(options![3].name.english)
                                .padding()
                                .background(Color(hex: "ee1515"))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(hex: "8b0000"), lineWidth: 2)
                                )
                        }
                        
                    }.padding()
                }
                
            }
        }
        .padding()
        .onAppear { 
            getQuizOptions() 
        }
        .alert(
            alertMsg,
            isPresented: $showAlert,
            actions: {
                Button("Ok", 
                       role: .cancel, 
                       action: { refresh() }
                )
            },
            message: { Text(alertBody) }
        )
                
        
    }
    
    func refresh() {
        if(self.alertMsg == "You're Right!!!") {
            getQuizOptions()
        }
    }
    
    func doSelection(opt : Int) {
        if(opt == correct!.id) {
            currentStreak += 1
            self.alertMsg = "You're Right!!!"
            self.alertBody = String(format: "You've got a streak of %d going!  Keep it up!", self.currentStreak)
            self.imageType = Image.TemplateRenderingMode.original
        }
        else {
            self.alertMsg = "Oooh Sorry..."
            self.alertBody = String(format: "Your streak of %d is over!  Try to beat it!", self.currentStreak)
            self.imageType = Image.TemplateRenderingMode.template
            self.currentStreak = 0
        }
        
        self.showAlert.toggle()
    }
    
    func getQuizOptions() {
        
        self.imageType = Image.TemplateRenderingMode.template
        
        let floorId = Int.random(in: 0 ... globalModel.Pokemon.count - 4) + 1
        
        let pkm = globalModel.Pokemon.filter {
            ($0.id >= floorId) && ($0.id < floorId+4)
        }
        
        options = pkm
        
        let correctIdx = Int.random(in: 0 ... 3)
        correct = pkm[correctIdx]
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(GlobalData())
    }
}


