//
//  ResultView.swift
//  berkain
//
//  Created by Safik Widiantoro on 16/04/23.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var batikContainer : InitialBatikContainer
    @State private var isActive = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                GeometryReader { geometry in
                    VStack(alignment: .center){
                        Text("Yeay!🥳")
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                            .padding(.bottom, geometry.size.width * 0.01)
                        Text("Thank you so much for helping me so that I won't look like a poser anymore when i wearing batik especially for berkain trend.")
                            .font(.system(size: 14))
                        ZStack{
                            Rectangle()
                                .fill(Color("BluePrimary"))
                                .frame(width: geometry.size.width * 0.60, height: geometry.size.height * 0.60)
                                .border(.black)
                                .padding([.top, .leading], 20.0)
                            
                            Rectangle()
                                .fill(Color("Background"))
                                .frame(width: geometry.size.width * 0.60, height: geometry.size.height * 0.60)
                                .border(Color("BluePrimary"))
                            
                            Image( batikContainer.result.batik?.asset ?? "" )
                                .resizable()
                                .scaledToFit()
                                .frame(height: geometry.size.height * 0.57)
                            
                            Image( batikContainer.result.person?.asset ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(height: geometry.size.height * 0.57)
                        }
                        NavigationLink(destination: HomeView(), isActive: $isActive) {
                            
                            Button(action: {
                                batikContainer.result.batik = nil
                                isActive = true
                            }) {
                                Text("Try Again")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color("BluePrimary"))
                                    .clipShape(
                                        Ellipse())
                                    .overlay(
                                        Ellipse()
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            }
                        }
                        .padding(.top, geometry.size.width * 0.06)
                    }.frame(width: geometry.size.width,height: geometry.size.height )
                    
                }
                .background(Color("Background"))
                .navigationBarBackButtonHidden(true)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
