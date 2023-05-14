//
//  OnBoardView.swift
//  berkain
//
//  Created by Safik Widiantoro on 15/04/23.
//

import SwiftUI


struct OnBoardView: View {
    @State private var isAnimated = false
    @State private var isActive = false
    @EnvironmentObject var batikContainer : InitialBatikContainer
    
    var body: some View {
        GeometryReader { geometry in
            if #available(iOS 16.0, *) {
                NavigationStack{
                    
                    
                    TabView {
                        VStack{
                            Spacer()
                            Text("HELP!!!")
                                .font(.system(size: 100))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            Spacer()
                            Text("Swipe to help")
                                .padding(geometry.size.height * 0.06)
                                .foregroundColor(.gray)
                                
                        }
                        
                        ZStack{
                            Rectangle()
                                .fill(Color("BluePrimary"))
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.6)
                                .border(.black)
                                .padding([.top, .leading], 20.0)
                            
                            Rectangle()
                                .fill(.white)
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.6)
                                .border(Color("BluePrimary"))
                            
                            HStack{
                                Text ("help me break the stereotype!")
                                    .font(.system(size: 40))
                                    .fontWeight(.bold)
                                
                                    .onAppear(){
                                        
                                        withAnimation(.easeInOut(duration: 1.0).repeatForever()) {
                                            isAnimated = true
                                        }
                                    }
                                    .frame(width: geometry.size.width * 0.38, height: geometry.size.width * 0.6)
                                    .scaleEffect(isAnimated ? 1.5 : 1.0)
                                
                                    .foregroundColor(Color("BluePrimary"))
                                
                                Text ("My friends have been calling me a poser and even edgy for following **the “Berkain Bersama” trend** because \ni don't truly understanding the significance of batik. \nCan you help me change that?")
                                    .font(.system(size: 32))
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            }
                            .frame(width: geometry.size.width * 0.78, height: geometry.size.width * 0.6)
                            .multilineTextAlignment(.leading)
                            .padding()
                            
                        }
                        VStack{
                            HStack{
                                ZStack{
                                    Rectangle()
                                        .fill(Color("BluePrimary"))
                                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.4)
                                        .border(.black)
                                        .padding([.top, .leading], 20.0)
                                    
                                    Rectangle()
                                        .fill(Color("Background"))
                                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.4)
                                        .border(Color("BluePrimary"))
                                    
                                    Text("**The “Berkain Bersama” trend** is all about incorporating batik into your personal style, while also embracing its cultural significance. \n\nLet's show the world how to wear batik in a fresh and meaningful way.")
                                        .font(.system(size: 20))
                                        .frame(width: geometry.size.width * 0.38, height: geometry.size.height * 0.38)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                    
                                }
                                
                                
                                
                                ZStack{
                                    Rectangle()
                                        .fill(Color("BluePrimary"))
                                        .frame(width: 320, height: 400)
                                        .padding([.top, .leading], 20.0)
                                    
                                    Image("onboard1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 400)
                                    
                                        .border(Color("BluePrimary"))
                                    
                                    Text("...Let's explore the batik together!")
                                        .font(.title)
                                        .frame(width: 300)
                                        .padding(-150)
                                    
                                }
                                
                            }
                            
                            NavigationLink(destination: HomeView(), isActive: $isActive) {
                                
                                Button(action: {
                                    isActive = true
                                }) {
                                    Text("Get Started")
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
                        }
                        
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .background(Color("Background"))
                }.preferredColorScheme(.light)
            } else {
                // Fallback on earlier versions
            }
        }.navigationBarBackButtonHidden(true)
    }
    struct OnboardingPageView: View {
        var title: String
        var description: String
        
        var body: some View {
            HStack() {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("BluePrimary"))
                
                Text(description)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            .padding()
        }
    }
}

struct OnBoardView_Previews: PreviewProvider {
    
    static var previews: some View {
        OnBoardView()
    }
}
