//
//  HelpView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationStack{
            VStack{
                
                NavigationLink(destination: ContentView()){
                    Text("Voltar para home")
                        .font(.custom("Jura", size: 30))
                }
                
            }
        }
        .navigationTitle("Ajuda")
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
