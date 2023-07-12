//
//  ContentView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .center) {
                
                GeometryReader { geo in
                    Image("Home-screen")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(1.04)
                        .clipped()
                        .frame(width: geo.size.width, height: geo.size.height+65)
                        .edgesIgnoringSafeArea(.all)
                }
                
                VStack(alignment: .center) {
                    Image("logo")
                        .padding(.bottom, 40)
                    
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination: ListaDeAtividades()){
                            ZStack{
                                Image("primary")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 268, height: 95)
                                Text("Iniciar")
                                    .font(.custom("Jura", size: 35))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.bottom, 12)
                            }
                            
                        }
                    }
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination: HelpView()){
                            ZStack{
                                Text("Ajuda")
                                    .font(.custom("Jura", size: 30))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.bottom, 10)
                                
                                Image("secondary")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 268, height: 100)
                            }
                            
                        }
                    }
                  
          
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        .navigationTitle("Home")
        .navigationBarHidden(true)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
