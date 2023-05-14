//
//  File.swift
//  berkain
//
//  Created by Safik Widiantoro on 15/04/23.
//

import Foundation

struct Result {
    var batik : Batik?
    var person : Person?
}

struct Person : Hashable{
    var id = UUID()
    var namaPerson = ""
    var asset = ""
}

struct Batik : Equatable{
    var id = UUID().uuidString
    var name : String = ""
    var location : String = ""
    var description : String = ""
    var asset : String = ""
    var btn_asset : String = ""
}

class InitialBatikContainer : ObservableObject{
    
    @Published var batiks : [Batik] = []
    @Published var persons : [Person] = []
    
    @Published var result : Result = Result()
    
    init(){
        persons.append(
            Person(namaPerson: "Style 1", asset: "berkain")
        )
        
        persons.append(
            Person(namaPerson: "Style 2", asset: "bercelana")
        )
        
        batiks.append(
            Batik(
                name : "Batik Mega Mendung",
                location : "Cirebon",
                description: "The Mega Mendung batik motif has a rich history and cultural significance. It is closely related to the long-standing tradition of batik in Cirebon, with records dating back to the 14th century. The motif's name, derived from the Indonesian language and influenced by the ethical teachings of the Keraton, reflects the local cultural values of nobility and behavior\n\nThe Mega Mendung motif's visual elements and structure reveal the fusion of Chinese cultural texts into a unified form with complete meaning. The symbol of clouds in the motif represents never-ending fortune, and the seven color gradations symbolize the seven layers in the sky.",
                asset: "megamendung",
                btn_asset: "btn_mega"
            )
            
            
        )
        
        batiks.append(
            Batik(
                name : "Batik Kawung",
                location : "Mataram Kingdom(Surakarta, Yogyakarta, Mangkunagaran, and Pakualaman)",
                description : "The Kawung Batik motif is a batik pattern characterized by neatly arranged circular shapes resembling the kawung fruit (a type of coconut or sometimes considered as palm fruit or kolang-kaling). This motif is believed to have been created by one of the Sultans of the Mataram kingdom and first appeared in the 13th century in Java, as seen in the wall carvings of several temples such as Prambanan.\n\nThe symbolic meaning of the Kawung motif is perfection, purity, and sanctity. It represents the emptiness of worldly desires and passions, leading to perfect self-control. This emptiness makes a person neutral, impartial, and willing to go with the flow of life, allowing everything around them to unfold according to the will of nature. The Kawung motif is often depicted on the figure of Semar in wayang (traditional Javanese puppetry), symbolizing wisdom.\n\nThe Kawung motif was created by Sultan Agung Hanyokrokusumo of Mataram, inspired by the natural form of the aren or kolang-kaling fruit, which is elongated and pure white in color.",
                asset : "kawung",
                btn_asset: "btn_kawung"
            )
        )
        
        batiks.append(
            Batik(
                name : "Batik Truntum",
                location : "Yogyakarta",
                description : "Batik Truntum is a traditional Indonesian fabric with a motif that symbolizes love, guidance, and growth.\n\nThe word 'Truntum' comes from Javanese language, meaning 'growing again'. It is often used in wedding ceremonies by parents as a symbol of their guidance and role-modeling for the newlywed couple.\n\nThe motif is usually black and white, with scattered floral patterns resembling Jasmine. Truntum fabric is popular in Yogyakarta and Solo, and is now also used in Muslim women's clothing.\n\nThe motif represents unconditional and eternal love, and the belief that love grows richer over time. It is associated with natural dyes and worn at weddings, and signifies the parents' role in guiding the couple as they enter married life.",
                asset : "truntum",
                btn_asset: "btn_truntum"
            )
        )
    }
    
}
