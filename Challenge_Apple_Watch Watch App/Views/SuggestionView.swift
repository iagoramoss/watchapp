//
//  ContentView.swift
//  Challenge_Apple_Watch Watch App
//
//  Created by Dessana Santos on 07/11/22.
//

import SwiftUI

struct SuggestionView: View {
    
    @State var showTransitionView: Bool = false
    
    var backHomeAction: () -> ()
    
    var body: some View {
        
    let tip = AppreciateTips.allCases.randomElement()!
    let tipTitle = String(describing: tip.rawValue)
    let tipImage = tip.image
        
        ZStack{
            NavigationStack {
                ScrollView {
                    GeometryReader { geometry in
                        VStack {
                            tipImage
                                .frame(width: geometry.size.width * 0.22, height: geometry.size.height * 0.14)
                                .padding(.top, 13)
                                .padding(.bottom, 12)
                            
                            Text("Sugestão apreciativa")
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.07, alignment: .center)
                                .font(.system(size: 16.0))
                                .fontWeight(.semibold)
                                .foregroundColor(.colorDefault)
                                .padding(.bottom, 8)
                            
                            Text(tipTitle)
                                .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.38, alignment: .center)
                                .font(.system(size: 14.0))
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(0.1)
                                .padding(.leading, 8)
                                .padding(.bottom, 8)
                            
                            // Botão Continuar
                            DefaultButtonView(
                                text: "Continuar",
                                width: geometry.size.width * 0.93,
                                height: 44,
                                cornerRadius: 22.0,
                                action: {
                                    showTransitionView.toggle()
                                    WKInterfaceDevice.current().play(.click)
                                }
                            )
                            
                            // "Navigation title" personalizada
                            .toolbar{
                                ToolbarItem(placement: .cancellationAction){
                                    Button(action: {
                                        backHomeAction()
                                        
                                    }, label: {
                                        Image(systemName: "chevron.backward.circle.fill")
                                        Text("Sugestões")
                                    }).foregroundColor(.colorDefault)
                                }
                            }
                        }
                    }.frame(height: WKInterfaceDevice.current().screenBounds.size.height, alignment: .leading)
                }
            }
            if showTransitionView{
                TransitionView(closeViewAction: {
                    showTransitionView.toggle()
                    backHomeAction()
                })
            }
        }
    }
}
struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(backHomeAction: {})
        //            .environmentObject(EatingTime())
    }
}

//        "Busque um ambiente  e tranquilo para realizar a refeição faz toda a diferença.",
//        "Evite mexer no celular ou assistir à televisão enquanto se alimenta."
