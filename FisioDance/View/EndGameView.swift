//
//  EndGameView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//

import SwiftUI

struct EndGameView: View {
    var body: some View {
            ZStack{
                
                Image("end-game")
                
                
                VStack{
                    Image("Mask group")
                    VStack{
                        HStack{
                            Text("Alongamento simples")
                                .foregroundColor(Color("dark-blue90"))
                                .font(.custom("Jura", size: 39))
                        }
                        .frame(width: 665,height: 46)
                        
                        
                        HStack{
                            Text("E aí, o que que achou dessa prática? Classifique o grau de dificuldade para que a gente possa aperfeiçoar nossas ofertas pra você!")
                                .foregroundColor(Color("dark-blue90"))
                                .font(.custom("Jura", size: 24))
                        }
                        .frame(width: 665, height: 96)
                        
                        
                        HStack{
                            UserFeedbackView()
                        }
                        
                        .frame(width: 665, height: 74)
                        
                        
                        
                        HStack{
                            
                            Button(action: {
                                //action here
                            }) {
                                NavigationLink(destination: GameView()){
                                    ZStack {
                                        Image("repeat-button")
                                        
                                        Text("Repetir")
                                            .font(.custom("Jura", size: 30))
                                            .bold()
                                            .foregroundColor(Color("dark-blue90"))
                                            .padding(.bottom, 10)
                                            .padding(.trailing, 30)
                                        
                                        
                                    }
                                }
                            }
                            
                            
                            
                            Spacer()
                            
                            Button(action: {
                                //action here
                            }) {
                                NavigationLink(destination: ListaDeAtividades()){
                                    ZStack {
                                        Image("menu-button")
                                        
                                        Text("Menu")
                                            .font(.custom("Jura", size: 30))
                                            .bold()
                                            .foregroundColor(Color("dark-blue90"))
                                            .padding(.bottom, 15)
                                            .padding(.trailing, 35)
                                        
                                        
                                    }
                                }
                            }
                            
                            
                        }
                        //.frame(width:665,height: 70)
                        
                        
                    }
                    
                    .frame(width: 665,height: 370)
                    
                }
            }
        
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
