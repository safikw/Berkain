//
//  ContentView.swift
//  LetsBerkain
//
//  Created by Safik Widiantoro on 10/04/23.
//

import SwiftUI



struct HomeView: View {
    @EnvironmentObject var batikContainer : InitialBatikContainer
    
    @State var selectedTab  =  UUID()
    @State var isTextExist = false
    @State private var isActive = false
    @State private var showAlert = false
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                
                GeometryReader { geometry in
                        VStack {
                            Text("Let's try berkain and choose a batik pattern for a fashionable and cultural look!")
                                .multilineTextAlignment(.center)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.top, geometry.size.height * 0.02)
                            //person card
                            
                            HStack{
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
                                        .frame(height: geometry.size.height * 0.4)
                                    
                                    Image( batikContainer.result.person?.asset ?? "")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: geometry.size.height * 0.57)
                                    
                                    Picker("What is", selection: $selectedTab){
                                        ForEach(batikContainer.persons, id: \.id){
                                            person in
                                            Text(person.namaPerson).tag(person.id)
                                        }
                                    }.pickerStyle(.segmented)
                                        .frame(width: 250)
                                        .position(x: geometry.size.width * 0.13 , y: geometry.size.height * 0.1 )
                                    
                                        .onChange(of: selectedTab, perform: { newValue in
                                            if let personIndex = batikContainer.persons.firstIndex(where: { person in
                                                return person.id == selectedTab
                                            }){
                                                batikContainer.result.person = batikContainer.persons[personIndex]
                                            }
                                        })
                                        .onAppear{
                                            if let person = batikContainer.persons.first(where: { $0.namaPerson == "Style 1" }) {
                                                selectedTab = person.id
                                            }
                                            
                                        }
                                }
                                
                                //text card
                                
                                if let batik = batikContainer.result.batik{
                                    VStack{
                                        ZStack{
                                            Rectangle()
                                                .fill(Color("BluePrimary"))
                                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.13)
                                                .border(.black)
                                                .padding([.top, .leading], 20.0)
                                            
                                            Rectangle()
                                                .fill(Color("Background"))
                                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.13)
                                                .border(Color("BluePrimary"))
                                            
                                            VStack(alignment: .center){
                                                Text("\(batik.name)")
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 20))
                                                    .multilineTextAlignment(.center)
                                                
                                                
                                                Text("Origin from \(batik.location)")
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 12))
                                                    .foregroundColor(Color.gray)
                                                    .multilineTextAlignment(.center)
                                                    .frame(width: geometry.size.width * 0.28)
                                                
                                            }
                                            
                                        }
                                        
                                        ZStack{
                                            Rectangle()
                                                .fill(Color("BluePrimary"))
                                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.43)
                                                .border(.black)
                                                .padding([.top, .leading], 20.0)
                                            
                                            Rectangle()
                                                .fill(Color("Background"))
                                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.43)
                                                .border(Color("BluePrimary"))
                                            
                                            ScrollView{
                                                
                                                Text("\(batik.description)")
                                                        .multilineTextAlignment(.leading)
                                                        .padding([.top,.bottom], 10)
                                                        .frame(width: geometry.size.width * 0.28)
                                                        .fixedSize(horizontal: false, vertical: true)
                                            }.frame(height: geometry.size.height * 0.4)
                                            
                                        }
                                        
                                        
                                    }.padding(20)
                                    
                                }else{
                                    VStack{
                                        ZStack{
                                            Rectangle()
                                                .fill(Color("BluePrimary"))
                                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.13)
                                                .border(.black)
                                                .padding([.top, .leading], 20.0)
                                            
                                            Rectangle()
                                                .fill(Color("Background"))
                                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.13)
                                                .border(Color("BluePrimary"))
                                            
                                            
                                        }
                                        
                                        ZStack{
                                            Rectangle()
                                                .fill(Color("BluePrimary"))
                                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.43)
                                                .border(.black)
                                                .padding([.top, .leading], 20.0)
                                            
                                            Rectangle()
                                                .fill(Color("Background"))
                                                .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.43)
                                                .border(Color("BluePrimary"))
                                            
                                        }
                                        
                                    }.padding(20)
                                }
                            }
                            
                            HStack{
                                //Button batik
                                VStack(alignment: .leading){
                                    Text("Choose Batik Pattern")
                                        .fontWeight(.medium)
                                        .padding([.leading], geometry.size.width * 0.02)
                                    HStack{
                                        ForEach ( $batikContainer.batiks, id: \.id ){
                                            $batik in
                                            Button(action: {
                                                if batikContainer.result.batik == batik {
                                                    withAnimation{
//
                                                    }
                                                    batikContainer.result.batik = nil
                                                } else {
                                                    batikContainer.result.batik = batik
                                                }
                                            }){
                                                Image(batik.btn_asset)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: geometry.size.height * 0.10 )
                                                
                                            }
                                        }
                                        .padding(5)
                                        
                                        
                                    }.padding([.leading], geometry.size.width * 0.01)
                                    
                                }
                                
                                
                                //Button arrow
                                Spacer()
                                
                                NavigationLink(destination: ResultView(), isActive: $isActive) {
                                    Button(action: {
                                        if batikContainer.result.batik == nil {
                                            showAlert = true
                                        } else {
                                            isActive = true
                                        }
                                    }) {
                                        Text("Done")
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
                                .padding([.top,.trailing], geometry.size.height * 0.03 )
                                .alert(isPresented: $showAlert) {
                                    Alert(title: Text("Oh nooo😭🥹"), message: Text("Please choose a batik pattern first"), dismissButton: .default(Text("OK")))
                                    
                                }
                            }
                        }
                        
                    
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .background(
                        Color("Background")
                    )
                }
            }
            .navigationBarBackButtonHidden(true)
        }else {
            // Fallback on earlier versions
        }
        
        
    }
}


    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }

