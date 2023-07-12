//
//  HelpView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//

import SwiftUI

struct HelpView: View {
    
    @State private var items = HelpItems.exampleData
    @State private var selection: HelpItems?
    
    var body: some View {
        NavigationSplitView(){
            List(items, selection: $selection) { item in
                Text(item.name).tag(item)
                    .font(.custom("Kite One", size: 24))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(.white)
            }
            .background{
                Color(red: 10/255, green: 132/255, blue: 178/255)
                Image("background-sidebar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            }
            .scrollContentBackground(.hidden)
            //.navigationTitle("Ajuda") //-> nessa posição, o título fica em cima da sidebar.
        } detail: {
            if let selected = selection {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(selected.details)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .font(.custom("Jura", size: 26))
                            .foregroundColor(Color(red: 10/255, green: 132/255, blue: 178/255))
                            .fontWeight(.bold)
                    }
                    //Definições de texto na detail mas que não estão sendo usadas
                    
                    VStack {
                        Image(uiImage: selected.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                        
                        //HStack {
                            Image(uiImage: selected.image2)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                            //.frame(width: 600, height: 631)
                            
                            Image(uiImage: selected.image3)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                            //.frame(width: 600, height: 631)
                        //}
                        .frame(alignment: .topTrailing)
                    }
                }
                //.navigationTitle(selected.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text(selected.name).font(.custom("Jura", size: 39))
                                .foregroundColor(Color(red: 10/255, green: 132/255, blue: 178/255))
                                .fontWeight(.bold)
                        }
                    }
                }
                .background(Color(red: 215/255, green: 244/255, blue: 1))
                
            } else {
                Text("Escolha ao lado")
                    .navigationTitle("")
                    .font(.custom("Jura", size: 18))
                    .foregroundColor(Color(red: 10/255, green: 132/255, blue: 178/255))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 600, leading: 0, bottom: 600, trailing: 0))
                //ScrollView tá pegando espaço do título da detail, deixando ele alinhado centralmente e com a fonte menor. Tá deixando o texto "Escolha ao lado" na parte central superior da tela. Sem a ScrollView, a cor do background não fica inteira no fundo, somente na linha do texto "Escolha ao lado".
                //<padding(EdgeInsets)> resolveu o problema.
                    .background(Color(red: 215/255, green: 244/255, blue: 1))
            }
        }
        //.navigationTitle("Ajuda") //nessa posição, o título fica no centro superior da detail.
        .accentColor(Color(red: 215/255, green: 244/255, blue: 1))
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
    
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

struct HelpItems: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let details: String
    let image: UIImage
    let image2: UIImage
    let image3: UIImage
}

extension HelpItems {
    static var exampleData: [HelpItems] {
        [
            .init(name: "Tela de início", details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pellentesque et ex ac tincidunt. Integer vitae ultricies enim. Nulla facilisi. Sed rhoncus mollis nulla a rhoncus. Donec consectetur, justo non consequat blandit, nibh erat dapibus ipsum, ut consectetur nunc sem in diam. Duis nec dolor accumsan, ullamcorper leo id, vulputate urna.", image: UIImage(imageLiteralResourceName: "start"), image2: UIImage(imageLiteralResourceName: "start"), image3: UIImage(imageLiteralResourceName: "gambiarra")),
            .init(name: "Escolha de exercícios", details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pellentesque et ex ac tincidunt. Integer vitae ultricies enim. Nulla facilisi. Sed rhoncus mollis nulla a rhoncus. Donec consectetur, justo non consequat blandit, nibh erat dapibus ipsum, ut consectetur nunc sem in diam. Duis nec dolor accumsan, ullamcorper leo id, vulputate urna.", image: UIImage(imageLiteralResourceName: "list"), image2: UIImage(imageLiteralResourceName: "list"), image3: UIImage(imageLiteralResourceName: "gambiarra")),
            .init(name: "Tela de jogo", details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pellentesque et ex ac tincidunt. Integer vitae ultricies enim. Nulla facilisi. Sed rhoncus mollis nulla a rhoncus. Donec consectetur, justo non consequat blandit, nibh erat dapibus ipsum, ut consectetur nunc sem in diam. Duis nec dolor accumsan, ullamcorper leo id, vulputate urna.", image: UIImage(imageLiteralResourceName: "play"), image2: UIImage(imageLiteralResourceName: "play"), image3: UIImage(imageLiteralResourceName: "gambiarra")),
            .init(name: "Fim de jogo", details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pellentesque et ex ac tincidunt. Integer vitae ultricies enim. Nulla facilisi. Sed rhoncus mollis nulla a rhoncus. Donec consectetur, justo non consequat blandit, nibh erat dapibus ipsum, ut consectetur nunc sem in diam. Duis nec dolor accumsan, ullamcorper leo id, vulputate urna.", image: UIImage(imageLiteralResourceName: "end"), image2: UIImage(imageLiteralResourceName: "end"), image3: UIImage(imageLiteralResourceName: "gambiarra")),
        ]
    }
}
